local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript(
	"OnEvent",
	function(self, event)
		TargetFrameSpellBar:SetScale(1.1)
		CastingBarFrame:SetScale(1.6)
		CastingBarFrame:SetSize(150, 10)
		CastingBarFrame:ClearAllPoints()
		--CastingBarFrame:SetPoint("TOP", UIParent, "BOTTOM", 0, 100)
		--CastingBarFrame.SetPoint = function()
		--end
		CastingBarFrame.Border:Hide()
		CastingBarFrame.Border:SetSize(240, 40)
		CastingBarFrame.Border:SetPoint("TOP", CastingBarFrame, 0, 15)
		CastingBarFrame.Border:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small")

		CastingBarFrame.Flash:SetSize(240, 40)
		CastingBarFrame.Flash:SetPoint("TOP", CastingBarFrame, 0, 15)
		CastingBarFrame.Flash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small")

		CastingBarFrame.Text:SetPoint("TOP", CastingBarFrame, 0, 4)

		local function CastingBarFrame_OnUpdate_Hook(self, elapsed)
			if not self.timer then
				return
			end
			if self.update and self.update < elapsed then
				if self.casting then
					self.timer:SetText(format("%.1f", max(self.maxValue - self.value, 0)))
				elseif self.channeling then
					self.timer:SetText(format("%.1f", max(self.value, 0)))
				else
					self.timer:SetText("")
				end
				self.update = .1
			else
				self.update = self.update - elapsed
			end
		end

		-- Player,Target CastingBar timers
		for i, frame in pairs(
			{
				CastingBarFrame
				--TargetFrameSpellBar
			}
		) do
			frame.timer = frame:CreateFontString(nil)
			frame.timer:SetFont("Fonts\\ARIALN.ttf", 13, "THINOUTLINE")
			frame.timer:SetPoint("RIGHT", frame, "RIGHT", 24, 0)
			frame.update = 0.1
			frame:HookScript("OnUpdate", CastingBarFrame_OnUpdate_Hook)
		end
	end
)
