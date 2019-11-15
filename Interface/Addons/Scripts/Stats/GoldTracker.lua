local ADDON_NAME, addon = ...
if not _G[ADDON_NAME] then
  _G[ADDON_NAME] = CreateFrame("Frame", ADDON_NAME, UIParent)
end
addon = _G[ADDON_NAME]

addon:SetScript(
  "OnEvent",
  function(self, event, ...)
    if self[event] then
      return self[event](self, event, ...)
    end
  end
)

local questHistory = {}
local playerSession = {}
local starttime
local auditorTag

local COPPER_PER_SILVER = 100
local SILVER_PER_GOLD = 100
local COPPER_PER_GOLD = COPPER_PER_SILVER * SILVER_PER_GOLD

local staticGMFWidth = 61

----------------------
--      Enable      --
----------------------

local function GetPlayerMoney()
  return (GetMoney() or 0) - GetCursorMoney() - GetPlayerTradeMoney()
end

local function ReturnCoinValue(money, separateThousands)
  if not money then
    return
  end

  local goldString, silverString, copperString

  local gold = floor(money / (COPPER_PER_SILVER * SILVER_PER_GOLD))
  local silver = floor((money - (gold * COPPER_PER_SILVER * SILVER_PER_GOLD)) / COPPER_PER_SILVER)
  local copper = mod(money, COPPER_PER_SILVER)

  if (separateThousands) then
    goldString = GOLD_AMOUNT_TEXTURE_STRING:format(FormatLargeNumber(gold), 0, 0)
  else
    goldString = GOLD_AMOUNT_TEXTURE:format(gold, 0, 0)
  end
  silverString = SILVER_AMOUNT_TEXTURE:format(silver, 0, 0)
  copperString = COPPER_AMOUNT_TEXTURE:format(copper, 0, 0)

  return gold, silver, copper, goldString, silverString, copperString
end

local function DoQuestLogScan()
  for i = 1, GetNumQuestLogEntries() do
    local title, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(i)
    if not isHeader then
      if questID and not questHistory[questID] then
        questHistory[questID] = {
          money = GetQuestLogRewardMoney(questID) or 0,
          gotReward = false,
          questID = questID,
          title = title
        }
      end
    end
  end
end

local function ChatMoneyScan(msg)
  local GOLD_SCAN_AMOUNT = string.gsub(GOLD_AMOUNT, "%%d", "(%%d+)")
  local SILVER_SCAN_AMOUNT = string.gsub(SILVER_AMOUNT, "%%d", "(%%d+)")
  local COPPER_SCAN_AMOUNT = string.gsub(COPPER_AMOUNT, "%%d", "(%%d+)")
  local copper = string.match(msg, COPPER_SCAN_AMOUNT)
  local silver = string.match(msg, SILVER_SCAN_AMOUNT)
  local gold = string.match(msg, GOLD_SCAN_AMOUNT)
  local money = (gold or 0) * 10000 + (silver or 0) * 100 + (copper or 0)

  return gold, silver, copper, money
end

local function updateRepairCost()
  if CanMerchantRepair() then
    local repairCost, canRepair = GetRepairAllCost()
    if canRepair and repairCost > 0 then
      if not addon.totalRepairCost or addon.totalRepairCost ~= repairCost then
        addon.totalRepairCost = repairCost
      end
    end
  end
end

------------------------------
--      Event Handlers      --
------------------------------

function addon:PLAYER_LOGIN()
  if not GOLD_DB then
    GOLD_DB = {}
  end
  GOLD_DB.scale = 1
  if GOLD_DB.showTotalEarned == nil then
    GOLD_DB.showTotalEarned = true
  end
  if GOLD_DB.fontColor == nil then
    GOLD_DB.fontColor = false
  end

  self:CreateGoldFrame()
  self:RestoreLayout(ADDON_NAME)

  local currentPlayer = UnitName("player")
  local currentRealm = GetRealmName() --get shortend realm name with no spaces and dashes

  GOLD_DB[currentRealm] = GOLD_DB[currentRealm] or {}
  GOLD_DB[currentRealm][currentPlayer] = GOLD_DB[currentRealm][currentPlayer] or {}
  addon.player_DB = GOLD_DB[currentRealm][currentPlayer]
  if not addon.player_DB.money then
    addon.player_DB.money = GetPlayerMoney()
  end

  if not addon.player_DB.lifetime then
    addon.player_DB.lifetime = {}
  end
  addon.player_LT = addon.player_DB.lifetime
  if not addon.player_LT.money then
    addon.player_LT.money = GetPlayerMoney()
  end

  DoQuestLogScan()

  starttime = GetTime()

  self:RegisterEvent("PLAYER_MONEY")
  self:RegisterEvent("QUEST_ACCEPTED")
  self:RegisterEvent("QUEST_REMOVED")
  self:RegisterEvent("QUEST_TURNED_IN")
  self:RegisterEvent("CHAT_MSG_MONEY")
  self:RegisterEvent("TAXIMAP_OPENED")

  self:RegisterEvent("MERCHANT_SHOW")
  self:RegisterEvent("MERCHANT_CLOSED")
  self:UnregisterEvent("PLAYER_LOGIN")
  self.PLAYER_LOGIN = nil
end

function addon:PLAYER_MONEY(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  local tmpMoney = GetPlayerMoney()

  if addon.player_DB.money then
    self.DiffMoney = tmpMoney - addon.player_DB.money
  else
    self.DiffMoney = 0
  end
  addon.player_DB.money = tmpMoney

  playerSession.lastMoneyDiff = self.DiffMoney
  playerSession.netProfit = (playerSession.netProfit or 0) + self.DiffMoney

  --it's positive money so lets add it to our session and lifetime
  if self.DiffMoney > 0 then
    playerSession.money = (playerSession.money or 0) + self.DiffMoney
    addon.player_LT.money = (addon.player_LT.money or 0) + self.DiffMoney
  else
    playerSession.spent = (playerSession.spent or 0) + self.DiffMoney
    addon.player_LT.spent = (addon.player_LT.spent or 0) + self.DiffMoney
  end

  addon:UpdateButtonText()

  if auditorTag and auditorTag == "taxi" and UnitOnTaxi("player") then
    --diff comes in as negative so make it positive for storing
    playerSession.taxi = (playerSession.taxi or 0) + (self.DiffMoney * -1)
    addon.player_LT.taxi = (addon.player_LT.taxi or 0) + (self.DiffMoney * -1)
    auditorTag = nil
    return
  end

  local checkMerchant = false

  if auditorTag and auditorTag == "merchant" then
    checkMerchant = true
  elseif MerchantFrame and MerchantFrame:IsVisible() then
    --sometimes other addons fire Merchant_Show faster than we do and already perform actions like repairs
    --This is a catch all to check if the merchant frame is even opened.
    checkMerchant = true
  end

  if checkMerchant then
    --if they are in repair mode and haven't clicked repair all
    if InRepairMode() then
      playerSession.repairs = (playerSession.repairs or 0) + (self.DiffMoney * -1)
      addon.player_LT.repairs = (addon.player_LT.repairs or 0) + (self.DiffMoney * -1)
      --so long as their in repair mode they shouldn't be selling anything so return
      return
    end
    if addon.hasRepaired then
      addon.hasRepaired = false

      playerSession.repairs = (playerSession.repairs or 0) + addon.totalRepairCost
      addon.player_LT.repairs = (addon.player_LT.repairs or 0) + addon.totalRepairCost

      local previousRepairCost = addon.totalRepairCost
      addon.totalRepairCost = 0

      --did we do only repairs?
      if (previousRepairCost + self.DiffMoney) == 0 then
        --looks like we only did repairs since the money spent versus cost is zero, don't do merchant stuff
        return
      end

      --NOTE:  This is primarily for folks who have addons that auto repair and freaking sell grays at the same time.
      --we want to grab how much we actually got from vendoring not how much we got from vendoring minus the repair costs.
      --so lets add the repair costs back into the difference
      self.DiffMoney = previousRepairCost + self.DiffMoney
    end

    playerSession.merchant = (playerSession.merchant or 0) + self.DiffMoney
    addon.player_LT.merchant = (addon.player_LT.merchant or 0) + self.DiffMoney

    return
  end

  --CATCHALL- the merchant auditorTag flag didn't set quick enough but repairs were done.  So lets calculate it
  if addon.hasRepaired then
    addon.hasRepaired = false
    playerSession.repairs = (playerSession.repairs or 0) + addon.totalRepairCost
    addon.player_LT.repairs = (addon.player_LT.repairs or 0) + addon.totalRepairCost
    addon.totalRepairCost = 0
  end
end

function addon:TAXIMAP_OPENED()
  auditorTag = "taxi"
end

function addon:QUEST_ACCEPTED(event, questLogIndex, questID)
  if questID and not questHistory[questID] then
    questHistory[questID] = {
      money = GetQuestLogRewardMoney(questID) or 0,
      gotReward = false,
      questID = questID
    }

    --lets grab the title
    local title = GetQuestLogTitle(questLogIndex)

    if title then
      questHistory[questID].title = title
    else
      for i = 1, GetNumQuestLogEntries() do
        local xTitle, _, _, _, _, _, _, xQuestID = GetQuestLogTitle(i)
        if xQuestID and xQuestID == questID then
          questHistory[questID].title = xTitle
          return
        end
      end
    end
  end
end

function addon:QUEST_REMOVED(event, questID)
  if questHistory[questID] then
    if not questHistory[questID].gotReward then
      playerSession.quest = (playerSession.quest or 0) + questHistory[questID].money
      addon.player_LT.quest = (addon.player_LT.quest or 0) + questHistory[questID].money
    end
    questHistory[questID] = nil
  end
end

function addon:QUEST_TURNED_IN(event, questID, xpReward, moneyReward)
  if questHistory[questID] then
    questHistory[questID].gotReward = true
  end
  playerSession.quest = (playerSession.quest or 0) + moneyReward
  addon.player_LT.quest = (addon.player_LT.quest or 0) + moneyReward
end

function addon:CHAT_MSG_MONEY(event, msg)
  local gold, silver, copper, money = ChatMoneyScan(msg)
  if money then
    playerSession.loot = (playerSession.loot or 0) + money
    addon.player_LT.loot = (addon.player_LT.loot or 0) + money
  end
end

--these merchant functions can be slow depending on other addons
function addon:MERCHANT_SHOW()
  if not auditorTag or auditorTag ~= "merchant" then
    auditorTag = "merchant"
  end
  updateRepairCost()
end

function addon:MERCHANT_CLOSED()
  if auditorTag and auditorTag == "merchant" then
    auditorTag = nil
  end
end

----------------------
--      Utils      --
----------------------

hooksecurefunc(
  "AbandonQuest",
  function()
    local questID

    for k, v in pairs(questHistory) do
      if v.title and v.title == GetAbandonQuestName() then
        questID = k
        break
      end
    end

    if questID and questHistory[questID] then
      questHistory[questID] = nil
    end
  end
)

hooksecurefunc(
  "RepairAllItems",
  function(useGuildRepair, arg2)
    updateRepairCost()
    --we want to track OUR money not the guilds money for repairs
    if not useGuildRepair and not arg2 then
      addon.hasRepaired = true
    end
  end
)

--these two merchant hooks are really catch alls if the registered event ones fail
MerchantFrame:HookScript(
  "OnShow",
  function(self)
    if not auditorTag or auditorTag ~= "merchant" then
      auditorTag = "merchant"
    end
    updateRepairCost()
  end
)
MerchantFrame:HookScript(
  "OnHide",
  function(self)
    if auditorTag and auditorTag == "merchant" then
      auditorTag = nil
    end
  end
)

function addon:CreateGoldFrame()
  addon:SetWidth(staticGMFWidth)
  addon:SetHeight(12)
  addon:SetMovable(true)
  addon:SetClampedToScreen(true)
  addon:SetScale(GOLD_DB.scale)
  addon:SetBackdrop(nil)
  addon:EnableMouse(true)

  local g = addon:CreateFontString("xanGoldMineText", "ARTWORK", "GameFontNormal")
  g:SetJustifyH("LEFT")
  g:SetPoint("CENTER", 8, -2)
  g:SetText("-")
  if (g:GetStringWidth() + 40) > staticGMFWidth then
    addon:SetWidth(g:GetStringWidth() + 40)
  else
    addon:SetWidth(staticGMFWidth)
  end
  addon.btnText = g

  addon:SetScript(
    "OnMouseDown",
    function()
      if (IsShiftKeyDown()) then
        self.isMoving = true
        self:StartMoving()
      end
    end
  )
  addon:SetScript(
    "OnMouseUp",
    function()
      if (self.isMoving) then
        self.isMoving = nil
        self:StopMovingOrSizing()

        addon:SaveLayout(ADDON_NAME)
      end
    end
  )
  addon:SetScript(
    "OnLeave",
    function()
      GameTooltip:Hide()
    end
  )

  addon:SetScript(
    "OnEnter",
    function()
      local fontColor = {r = 1, g = 210 / 255, b = 0}
      if not GOLD_DB.fontColor then
        fontColor = {r = 1, g = 1, b = 1}
      end

      GameTooltip:SetOwner(self, "ANCHOR_NONE")
      GameTooltip:SetPoint(self:GetTipAnchor(self))
      GameTooltip:ClearLines()

      GameTooltip:AddDoubleLine(
        "Total Money:",
        addon.player_DB.money and GetMoneyString(addon.player_DB.money, true) or "",
        129 / 255,
        209 / 255,
        92 / 255,
        1,
        1,
        1
      )

      GameTooltip:AddLine(" ")
      GameTooltip:AddLine("Session", 64 / 255, 224 / 255, 208 / 255)
      GameTooltip:AddDoubleLine(
        "Total Earned:",
        playerSession.money and GetMoneyString(playerSession.money, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )
      GameTooltip:AddDoubleLine(
        "Total Spent:",
        playerSession.spent and GetMoneyString(playerSession.spent * -1, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )

      if playerSession.netProfit then
        if playerSession.netProfit > 0 then
          GameTooltip:AddDoubleLine(
            "Net Profit:",
            GetMoneyString(playerSession.netProfit, true),
            fontColor.r,
            fontColor.g,
            fontColor.b,
            0,
            1,
            0
          )
        else
          GameTooltip:AddDoubleLine(
            "Net Profit:",
            GetMoneyString(playerSession.netProfit * -1, true),
            fontColor.r,
            fontColor.g,
            fontColor.b,
            1,
            0,
            0
          ) --red
        end
      else
        GameTooltip:AddDoubleLine("Net Profit:", "", fontColor.r, fontColor.g, fontColor.b, 1, 1, 1)
      end

      GameTooltip:AddLine(" ")
      GameTooltip:AddDoubleLine(
        "Quest Rewards:",
        playerSession.quest and GetMoneyString(playerSession.quest, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )
      GameTooltip:AddDoubleLine(
        "Looted:",
        playerSession.loot and GetMoneyString(playerSession.loot, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )

      if playerSession.merchant then
        if playerSession.merchant > 0 then
          GameTooltip:AddDoubleLine(
            "Merchant:",
            GetMoneyString(playerSession.merchant, true),
            fontColor.r,
            fontColor.g,
            fontColor.b,
            1,
            1,
            1
          )
        else
          GameTooltip:AddDoubleLine(
            "Merchant:",
            GetMoneyString(playerSession.merchant * -1, true),
            fontColor.r,
            fontColor.g,
            fontColor.b,
            1,
            0,
            0
          ) --red
        end
      else
        GameTooltip:AddDoubleLine("Merchant:", "", fontColor.r, fontColor.g, fontColor.b, 1, 1, 1)
      end

      if playerSession.money and playerSession.money > 0 then
        local sessionTime = GetTime() - starttime
        local goldPerSecond = ceil(playerSession.money / sessionTime)
        local goldPerMinute = ceil(goldPerSecond * 60)
        local goldPerHour = ceil(goldPerSecond * 3600)

        GameTooltip:AddLine(" ")
        GameTooltip:AddDoubleLine(
          "Gold/Hour:",
          GetMoneyString(goldPerHour, true),
          fontColor.r,
          fontColor.g,
          fontColor.b,
          1,
          1,
          1
        )
      else
        GameTooltip:AddLine(" ")
        GameTooltip:AddDoubleLine("Gold/Hour:", "", fontColor.r, fontColor.g, fontColor.b, 1, 1, 1)
      end

      GameTooltip:AddLine(" ")
      GameTooltip:AddLine("Lifetime", 64 / 255, 224 / 255, 208 / 255)
      GameTooltip:AddDoubleLine(
        "Total Earned:",
        addon.player_LT.money and GetMoneyString(addon.player_LT.money, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )
      GameTooltip:AddDoubleLine(
        "Total Spent:",
        addon.player_LT.spent and GetMoneyString(addon.player_LT.spent * -1, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )
      GameTooltip:AddLine(" ")
      GameTooltip:AddDoubleLine(
        "Quest Rewards:",
        addon.player_LT.quest and GetMoneyString(addon.player_LT.quest, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )
      GameTooltip:AddDoubleLine(
        "Taxi Fares:",
        addon.player_LT.taxi and GetMoneyString(addon.player_LT.taxi, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )
      GameTooltip:AddDoubleLine(
        "Looted:",
        addon.player_LT.loot and GetMoneyString(addon.player_LT.loot, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )
      GameTooltip:AddDoubleLine(
        "Repairs:",
        addon.player_LT.repairs and GetMoneyString(addon.player_LT.repairs, true) or "",
        fontColor.r,
        fontColor.g,
        fontColor.b,
        1,
        1,
        1
      )

      if addon.player_LT.merchant then
        if addon.player_LT.merchant > 0 then
          GameTooltip:AddDoubleLine(
            "Merchant:",
            GetMoneyString(addon.player_LT.merchant, true),
            fontColor.r,
            fontColor.g,
            fontColor.b,
            1,
            1,
            1
          )
        else
          GameTooltip:AddDoubleLine(
            "Merchant:",
            GetMoneyString(addon.player_LT.merchant * -1, true),
            fontColor.r,
            fontColor.g,
            fontColor.b,
            1,
            0,
            0
          ) --red
        end
      else
        GameTooltip:AddDoubleLine("Merchant:", "", fontColor.r, fontColor.g, fontColor.b, 1, 1, 1)
      end

      GameTooltip:Show()
    end
  )

  addon:Show()
end

function addon:UpdateButtonText()
  local gold, silver, copper, goldString, silverString, copperString

  if GOLD_DB.showTotalEarned and playerSession.money then
    gold, silver, copper, goldString, silverString, copperString = ReturnCoinValue(playerSession.money, true)
    addon.btnText:SetTextColor(1, 210 / 255, 0, 1) --standard orange
  elseif not GOLD_DB.showTotalEarned and playerSession.netProfit then
    if playerSession.netProfit > 0 then
      gold, silver, copper, goldString, silverString, copperString = ReturnCoinValue(playerSession.netProfit, true)
      addon.btnText:SetTextColor(0, 1, 0, 1) --green
    else
      gold, silver, copper, goldString, silverString, copperString = ReturnCoinValue(playerSession.netProfit * -1, true)
      addon.btnText:SetTextColor(1, 0, 0, 1) --red
    end
  else
    addon.btnText:SetText("?")
    addon.btnText:SetTextColor(1, 210 / 255, 0, 1) --standard orange
    addon:SetWidth(staticGMFWidth)
    return
  end

  if gold and gold > 0 then
    --only show gold as priority
    addon.btnText:SetText(goldString)
  elseif silver and silver > 0 then
    --as a backup show silver
    addon.btnText:SetText(silverString)
  elseif copper and copper > 0 then
    --last resort copper
    addon.btnText:SetText(copperString)
  else
    addon.btnText:SetText("?")
  end
  if (addon.btnText:GetStringWidth() + 40) > staticGMFWidth then
    addon:SetWidth(addon.btnText:GetStringWidth() + 40)
  else
    addon:SetWidth(staticGMFWidth)
  end
end

function addon:SaveLayout(frame)
  if type(frame) ~= "string" then
    return
  end
  if not _G[frame] then
    return
  end
  if not GOLD_DB then
    GOLD_DB = {}
  end

  local opt = GOLD_DB[frame] or nil

  if not opt then
    GOLD_DB[frame] = {
      ["point"] = "CENTER",
      ["relativePoint"] = "CENTER",
      ["xOfs"] = 0,
      ["yOfs"] = 0
    }
    opt = GOLD_DB[frame]
    return
  end

  local point, relativeTo, relativePoint, xOfs, yOfs = _G[frame]:GetPoint()
  opt.point = point
  opt.relativePoint = relativePoint
  opt.xOfs = xOfs
  opt.yOfs = yOfs
end

function addon:RestoreLayout(frame)
  if type(frame) ~= "string" then
    return
  end
  if not _G[frame] then
    return
  end
  if not GOLD_DB then
    GOLD_DB = {}
  end

  local opt = GOLD_DB[frame] or nil

  if not opt then
    GOLD_DB[frame] = {
      ["point"] = "CENTER",
      ["relativePoint"] = "CENTER",
      ["xOfs"] = 0,
      ["yOfs"] = 0
    }
    opt = GOLD_DB[frame]
  end

  _G[frame]:ClearAllPoints()
  _G[frame]:SetPoint("LEFT", "StatsFrame", "RIGHT", 0, 0)
end

------------------------
--      Tooltip       --
------------------------

function addon:GetTipAnchor(frame)
  local x, y = frame:GetCenter()
  if not x or not y then
    return "TOPLEFT", "BOTTOMLEFT"
  end
  local hhalf = (x > UIParent:GetWidth() * 2 / 3) and "RIGHT" or (x < UIParent:GetWidth() / 3) and "LEFT" or ""
  local vhalf = (y > UIParent:GetHeight() / 2) and "TOP" or "BOTTOM"
  return vhalf .. hhalf, frame, (vhalf == "TOP" and "BOTTOM" or "TOP") .. hhalf
end

if IsLoggedIn() then
  addon:PLAYER_LOGIN()
else
  addon:RegisterEvent("PLAYER_LOGIN")
end
