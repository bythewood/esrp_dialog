Dialogs = {}

AddEventHandler("ESRP_Dialog:createDialog", function(id, title, subtitle, options)
  local cDialog = CreateDialog(tonumber(id),title,subtitle,options)
  Dialogs[id] = cDialog
end)

RegisterNetEvent("ESRP_Dialog:listDialog")
AddEventHandler("ESRP_Dialog:listDialog", function(id)
  TriggerEvent("ESRP_Dialog:getDialogFromId", id, function(dialog)
    if dialog then
      local options = dialog.getOptions()

      print("^2[ESRP Dialog]^0")
      print("ID: " .. dialog.getId() .. " | Title: " .. dialog.getTitle() .. " | Subtitle: " .. dialog.getSubtitle() .. " | Options: ")

      for k,v in pairs(options) do
        print(" - " .. options[k].name)
      end
    else
      print("^8[ESRP Dialog]^0 Dialog with ID: " .. id .. " doesn't exist.")
    end
  end)
end)

RegisterNetEvent("ESRP_Dialog:listDialogs")
AddEventHandler("ESRP_Dialog:listDialogs", function()
  TriggerEvent("ESRP_Dialog:getAllDialogs", function(dialog)
    print("^2[ESRP Dialog]^0")
    for k, v in pairs(dialog) do
      if k then
        print("ID: " .. v.getId() .. " | Title: " .. v.getTitle())
      end
    end
  end)
end)

RegisterNetEvent("ESRP_Dialog:UseOption")
AddEventHandler("ESRP_Dialog:UseOption", function(id, option)
local _source = source
  TriggerEvent("ESRP_Dialog:getDialogFromId", id, function(dialog)
    if dialog then
  		local _optionid = option + 1
      local options = dialog.getOptions()
  		if options[_optionid].focusOFF then
  			TriggerClientEvent("ESRP_Dialog:SetNuiFocus", _source)
  		end
  		options[_optionid].func(_source)
    else
      print("^8[ESRP Dialog]^0 Dialog with ID: " .. id .. " doesn't exist.")
    end
  end)
end)

RegisterNetEvent("ESRP_Dialog:openDialog")
AddEventHandler("ESRP_Dialog:openDialog", function(id , src)
  local _source
  if src ~= nil then
    _source = src
  else
    _source = source
  end
  TriggerEvent("ESRP_Dialog:getDialogFromId", id, function(dialog)
    if dialog then
      TriggerClientEvent("ESRP_Dialog:openDialogClient", _source, dialog.getId(), dialog.getTitle(), dialog.getSubtitle(), dialog.getOptions())
    else
      print("^8[ESRP Dialog]^0 Error! Incorrect dialog ID!")
    end
  end)
end)

function getDialogFromId(id)
	return Dialogs[id]
end

AddEventHandler("ESRP_Dialog:getDialogFromId", function(id, cb)
  if(Dialogs)then
    if(Dialogs[id])then
		    cb(Dialogs[id])
    else
		    cb(nil)
	  end
	else
		cb(nil)
	end
end)

AddEventHandler("ESRP_Dialog:getAllDialogs", function(cb)
  if(Dialogs)then
		cb(Dialogs)
	else
		cb(nil)
	end
end)

-- TriggerEvent("ESRP_Dialog:createDialog", 1, "EXAMPLE TITLE", "EXAMPLE SUBTITLE",
--   {
--     {name = "Option1", func = function(source) TriggerEvent('ESRP_Dialog:openDialog', 1 , source) end},
--     {name = "Option2",  func = function() print("SELECTED OPTION 2") end},
--     {name = "Option3",func =  function() print("SELECTED OPTION 3") end},
--     {name = "Option4",func = function() print("SELECTED OPTION 4") end},
--     {name = "Option5", func = function() print("SELECTED OPTION 5")end},
--     {name = "Option6",  func = function() print("SELECTED OPTION 6") end},
--     {name = "Option7",func =  function() print("SELECTED OPTION 7") end},
--     {name = "Option8",func = function() print("SELECTED OPTION 8") end}
--   }
-- )
