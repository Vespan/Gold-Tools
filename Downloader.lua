local dlstatus = require('moonloader').download_status
update_state_ = false
vers = 6.0

local inicfg = require 'inicfg'
local AutoUpdateCheck = inicfg.load(nil, '..\\lib\\Update Check [Gold Tools].ini') 
local Load_Config = inicfg.load({
	Options = {
		AutoUpdate = false,
		Message = false,
		Sound = false
	},
}, '..\\Gold Tools\\Gold Tools[Gold-RP].ini')

function PushMessage(text)
tag = '{00AAFF}[ Gold Tools ]: {FFFFFF}'
    sampAddChatMessage(tag..(text), -1)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function EXPORTS.Crash()

		downloadUrlToFile('https://raw.githubusercontent.com/Vespan/Gold-Tools/master/Crash%20Tools%20%5Bimgui%5D.lua', 'moonloader\\Gold Tools\\mp3\\give damage.mp3', function(id, status, p1, p2)
		end)
		print('[ Download ] Crash Tools [imgui].lua ������� ��������!')

end

function EXPORTS.Check() -- �������� ����������
	if Load_Config.Options.AutoUpdate then
		downloadUrlToFile('https://github.com/Jekmant/Gold-Tools/raw/master/Update%20Check%20%5BGold%20Tools%5D.ini', 'moonloader\\lib\\Update Check [Gold Tools].ini', function(id, status, p1, p2)
	        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
	            if tonumber(AutoUpdateCheck.Update.Version) > vers then

	                PushMessage('���� ���������!\n ��������...')
					update_state_ = true
				else
					PushMessage('���������� ���')
	            end
	        end  
	    end)        
    end
end

function EXPORTS.mp3(id)
	if id == 0 then -- give damage (���� ����)
		downloadUrlToFile('https://cdn.discordapp.com/attachments/725657585377607683/725658971578433636/dmg.mp3', 'moonloader\\Gold Tools\\mp3\\give damage.mp3', function(id, status, p1, p2)
		end)
		print('[ Download ] give damage.mp3 ������� ��������!')

	elseif id == 1 then -- take damage (�������� ����)

	downloadUrlToFile('https://cdn.discordapp.com/attachments/725657585377607683/725690800494608434/take_damage.mp3', 'moonloader\\Gold Tools\\mp3\\take damage.mp3', function(id, status, p1, p2)
	end)
	print('[ Download ] take damage.mp3 ������� ��������!')

	elseif id == 2 then -- notification (�����������)

		downloadUrlToFile('https://cdn.discordapp.com/attachments/725657585377607683/725661261198786590/Notification.mp3', 'moonloader\\Gold Tools\\mp3\\notification.mp3', function(id, status, p1, p2)
		end)
		print('[ Download ] notification.mp3 ������� ��������!')
	elseif id == 3 then -- report++

		downloadUrlToFile('https://cdn.discordapp.com/attachments/725657585377607683/849606023429357568/Report.mp3', 'moonloader\\Gold Tools\\mp3\\report++.mp3', function(id, status, p1, p2)
		end)
		print('[ Download ] report++.mp3 ������� ��������!')
	end
end

function EXPORTS.downloadImguiNotf_lua() -- ������ imgui_notf [NEW].lua
	downloadUrlToFile('https://raw.githubusercontent.com/Vespan/Gold-Tools/master/imgui_notf%20%5BNEW%5D.lua', 'moonloader\\imgui_notf [NEW].lua', function(id, status, p1, p2)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
			 PushMessage('�������� ������ <imgui_notf [NEW].lua>!')
		end 
	end)
end

function main()
	while true do wait(0)
		if update_state_ then -- ���� ���������� (�� ��������)
			downloadUrlToFile('https://github.com/Jekmant/Gold-Tools/blob/master/Admin%20Tools%20%5BGold-Rp%5D.luac?raw=true', 'moonloader\\Gold Tools.luac', function(id, status, p1, p2)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					PushMessage('�������� ����������!\n ������������..')
					print('�������')
					reloadScripts()
				end
			end)
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
