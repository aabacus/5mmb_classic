local frame = CreateFrame("Frame")
local messages = {
	"Способность пока недоступна",
	"Выполняется другое действие",
	"Невозможно делать это на ходу",
	"Предмет пока недоступен",
	"Недостаточно",
	"Некого атаковать",
	"Заклинание пока недоступно",
	"У вас нет цели",
	"Вы пока не можете этого сделать",
	"Ability is not ready yet",
	"Another action is in progress",
	"Can't attack while mounted",
	"Can't do that while moving",
	"Item is not ready yet",
	"Not enough",
	"Nothing to attack",
	"Spell is not ready yet",
	"You have no target",
	"You can't do that yet"
}

local enable
local onevent
local uierrorsframe_addmessage
local old_uierrosframe_addmessage

function enable()
	old_uierrosframe_addmessage = UIErrorsFrame.AddMessage
	UIErrorsFrame.AddMessage = uierrorsframe_addmessage
end

function uierrorsframe_addmessage(frame, text, red, green, blue, id)
	for i, v in ipairs(messages) do
		if text and text:match(v) then
			return
		end
	end
	old_uierrosframe_addmessage(frame, text, red, green, blue, id)
end

function onevent(frame, event, ...)
	if event == "PLAYER_LOGIN" then
		enable()
	end
end

frame:SetScript("OnEvent", onevent)
frame:RegisterEvent("PLAYER_LOGIN")
