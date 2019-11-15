local elapsed = 0

local onWorldMapUpdateHook = function(self, e)
  elapsed = elapsed + e
  if elapsed > .5 then -- update frequency
    elapsed = 0
    local groupSize = GetNumGroupMembers()
    if groupSize > 0 then
      local groupType = IsInRaid() and "Raid" or "Party"
      for i = 1, groupSize do
        local f = _G["WorldMap" .. groupType .. i]
        if f then
          if not f.overlay then
            f.overlay = f:CreateTexture(nil, "OVERLAY")
            f.overlay:SetDrawLayer("OVERLAY", 7)
          end

          f.overlay:ClearAllPoints()

          if WorldMapFrame_InWindowedMode() then
            f.overlay:SetPoint("TOPLEFT", f.icon, -size - 6, size + 6)
            f.overlay:SetPoint("BOTTOMRIGHT", f.icon, size + 6, -size - 6)
          else
            f.overlay:SetPoint("TOPLEFT", f.icon, -size, size)
            f.overlay:SetPoint("BOTTOMRIGHT", f.icon, size, -size)
          end

          local _, _, subgroup = GetRaidRosterInfo(i)

          f.overlay:SetTexture(
            groupType == "Raid" and ("Interface\\AddOns\\Scripts\\Textures\\map\\raid" .. subgroup) or
              "Interface\\AddOns\\Scripts\\Textures\\map\\party"
          )
          if f.unit and f:IsShown() then
            local _, class = UnitClass(f.unit)
            local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
            if color then
              f.overlay:SetVertexColor(color.r, color.g, color.b)
            else
              f.overlay:SetVertexColor(103 / 255, 103 / 255, 103 / 255)
            end
            if GetTime() % 1 < .5 then
              if UnitAffectingCombat(f.unit) then
                f.overlay:SetVertexColor(1, 0, 0)
              elseif UnitIsDeadOrGhost(f.unit) then
                f.overlay:SetVertexColor(.2, .2, .2)
              elseif UnitIsAFK(f.unit) then
                f.overlay:SetVertexColor(89 / 255, 0 / 255, 165 / 255)
              end
            end
          end
        end
      end
    end
  end
end

WorldMapFrame:HookScript("OnUpdate", onWorldMapUpdateHook)
