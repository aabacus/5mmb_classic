local dominos = IsAddOnLoaded("Dominos")
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript(
  "OnEvent",
  function(self, e)
    local g = CreateFrame("Frame")
    g:RegisterEvent("MERCHANT_SHOW")
    g:RegisterEvent("UI_ERROR_MESSAGE")
    g:RegisterEvent("CINEMATIC_START")
    g:RegisterEvent("TAXIMAP_OPENED")
    g:SetScript(
      "OnEvent",
      function(self, event, arg1, arg2, ...)
        if event == "CINEMATIC_START" and ScriptsDB.AUTOMATION.SKIP_CINEMATICS then
          if not IsControlKeyDown() then
            CinematicFrame_CancelCinematic()
          end
        end

        if event == "UI_ERROR_MESSAGE" and ScriptsDB.AUTOMATION.DISMOUNT then
          if arg1 == 50 then
            if arg2 == "You must be standing to do that" then
              DoEmote("STAND")
            elseif arg2 == "You are mounted" then
              Dismount()
            end
          elseif arg1 == 213 then
            if arg2 == "You are already mounted! Dismount first." then
              Dismount()
            end
          elseif arg1 == 504 then
            if arg2 == "You can't do that while mounted." then
              Dismount()
            end
          end
        end

        if event == "TAXIMAP_OPENED" then
          Dismount()
        end

        if event == "MERCHANT_SHOW" and ScriptsDB.AUTOMATION.SELL_JUNK then
          local bag, slot
          for bag = 0, 4 do
            for slot = 0, GetContainerNumSlots(bag) do
              local link = GetContainerItemLink(bag, slot)
              if link and (select(3, GetItemInfo(link)) == 0) then
                UseContainerItem(bag, slot)
              end
            end
          end
        end
      end
    )
  end
)
