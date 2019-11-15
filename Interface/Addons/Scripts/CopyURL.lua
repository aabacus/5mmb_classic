local patterns = {
  "(https://%S+%.%S+)",
  "(http://%S+%.%S+)",
  "(www%.%S+%.%S+)",
  "(%d+%.%d+%.%d+%.%d+:?%d*/?%S*)"
}

local SetHyperlink = _G.ItemRefTooltip.SetHyperlink
function _G.ItemRefTooltip:SetHyperlink(link, ...)
  if link and (strsub(link, 1, 3) == "url") then
    local editbox = ChatEdit_ChooseBoxForSend()
    ChatEdit_ActivateChat(editbox)
    editbox:Insert(string.sub(link, 5))
    editbox:HighlightText()
    return
  end

  SetHyperlink(self, link, ...)
end
