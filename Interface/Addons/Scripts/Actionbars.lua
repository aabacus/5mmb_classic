local dominos = IsAddOnLoaded("Dominos")
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript(
  "OnEvent",
  function(self, event)
    MainMenuBar:SetScale(ScriptsDB.ACTIONBARS.MAINBAR_SCALE)

    --Red buttons when out of range
    if (ScriptsDB.ACTIONBARS.OUT_OF_RANGE_INDICATOR) then
      local onEventHook = function(self, event, ...)
        if (event == "PLAYER_TARGET_CHANGED") then
          self.newTimer = self.rangeTimer
        end
      end

      local updateUsableHook = function(self)
        local icon = _G[self:GetName() .. "Icon"]
        local valid = IsActionInRange(self.action)
        if (valid == false) then
          icon:SetVertexColor(1.0, 0.1, 0.1)
        end
      end

      local onUpdateHook = function(self, elapsed)
        local rangeTimer = self.newTimer
        if (rangeTimer) then
          rangeTimer = rangeTimer - elapsed
          if (rangeTimer <= 0) then
            ActionButton_UpdateUsable(self)
            rangeTimer = TOOLTIP_UPDATE_TIME
          end
          self.newTimer = rangeTimer
        end
      end

      hooksecurefunc("ActionButton_OnEvent", onEventHook)
      hooksecurefunc("ActionButton_UpdateUsable", updateUsableHook)
      hooksecurefunc("ActionButton_OnUpdate", onUpdateHook)
    end

    if (ScriptsDB.ACTIONBARS.HIDE_GRYPHONS) then
      MainMenuBarLeftEndCap:Hide()
      MainMenuBarRightEndCap:Hide()
    end

    -- Snowfall keypress animation
    local animationsCount, animations = 5, {}
    local animationNum = 1
    local frame, texture, alpha1, scale1, scale2, rotation2

    for i = 1, animationsCount do
      frame = CreateFrame("Frame")
      texture = frame:CreateTexture()
      texture:SetTexture("Interface\\Cooldown\\star4")
      texture:SetAlpha(0)
      texture:SetAllPoints()
      texture:SetBlendMode("ADD")
      animationGroup = texture:CreateAnimationGroup()
      alpha1 = animationGroup:CreateAnimation("Alpha")
      alpha1:SetFromAlpha(0)
      alpha1:SetToAlpha(1)
      alpha1:SetDuration(0)
      alpha1:SetOrder(1)
      scale1 = animationGroup:CreateAnimation("Scale")
      scale1:SetScale(1.0, 1.0)
      scale1:SetDuration(0)
      scale1:SetOrder(1)
      scale2 = animationGroup:CreateAnimation("Scale")
      scale2:SetScale(1.5, 1.5)
      scale2:SetDuration(0.3)
      scale2:SetOrder(2)
      rotation2 = animationGroup:CreateAnimation("Rotation")
      rotation2:SetDegrees(90)
      rotation2:SetDuration(0.3)
      rotation2:SetOrder(2)
      animations[i] = {frame = frame, animationGroup = animationGroup}
    end

    local animateButton = function(self)
      if not self:IsVisible() then
        return true
      end
      local animation = animations[animationNum]
      local frame = animation.frame
      local animationGroup = animation.animationGroup
      frame:SetFrameStrata("HIGH")
      frame:SetFrameLevel(20)
      frame:SetAllPoints(self)
      animationGroup:Stop()
      animationGroup:Play()
      animationNum = (animationNum % animationsCount) + 1
      return true
    end

    if (ScriptsDB.ACTIONBARS.KEYPRESS_ANIMATION) then
      local multiActionButtonDownHook = function(bname, id)
        animateButton(_G[bname .. "Button" .. id])
      end

      local petActionButtonDownHook = function(id)
        local button
        if PetActionBarFrame then
          if id > NUM_PET_ACTION_SLOTS then
            return
          end
          button = _G["PetActionButton" .. id]
          if not button then
            return
          end
        end
        return animateButton(button)
      end

      local actionButtonDownHook = function(id)
        local button

        if OverrideActionBar and OverrideActionBar:IsShown() then
          if id > NUM_OVERRIDE_BUTTONS then
            return
          end
          button = _G["OverrideActionBarButton" .. id]
        end

        button = _G["ActionButton" .. id]

        if button then
          animateButton(button)
        end
      end

      hooksecurefunc("MultiActionButtonDown", multiActionButtonDownHook)
      hooksecurefunc("PetActionButtonDown", petActionButtonDownHook)
      hooksecurefunc("ActionButtonDown", actionButtonDownHook)
    end
  end
)

-- hide stance bar
--RegisterStateDriver(StanceBarFrame, "visibility", "hide")
