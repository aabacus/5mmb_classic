GameTimeFrame:Hide()
MinimapBorderTop:Hide()
MiniMapWorldMapButton:Hide()
MinimapZoomOut:Hide()
MinimapZoomIn:Hide()
MinimapToggleButton:Hide()
MinimapNorthTag:SetAlpha(0)
Minimap:EnableMouseWheel(true)
MinimapZoneText:SetPoint("TOPLEFT", "MinimapZoneTextButton", "TOPLEFT", 5, 5)

local onMouseWheel = function(self, delta)
	if (delta > 0) then
		Minimap_ZoomIn()
	else
		Minimap_ZoomOut()
	end
end

Minimap:SetScript("OnMouseWheel", onMouseWheel)
