RegisterCommand("getdialog", function(source, args, rawCommand)
  if Config.Debug then
    print("Dialog get incoming...")
    TriggerServerEvent('ESRP_Dialog:listDialog', tonumber(args[1]))
  end
end)

RegisterCommand("getdialogs", function(source, args, rawCommand)
  if Config.Debug then
    print("Dialog get all incoming...")
    TriggerServerEvent('ESRP_Dialog:listDialogs')
  end
end)

RegisterCommand("opendialog", function(source, args, rawCommand)
  if Config.Debug then
    print("Dialog open incoming...")
    TriggerServerEvent('ESRP_Dialog:openDialog', tonumber(args[1]))
  end
end)

RegisterNetEvent("ESRP_Dialog:openDialogClient")
AddEventHandler("ESRP_Dialog:openDialogClient", function(id, title, subtitle, options)
  if Config.Debug then
    print("Opening Dialog...")
    print("ID: " .. id)
    print("Title: " .. title)
    print("Subtitle: " .. subtitle)
    print("Options: ")
    for k,v in pairs(options) do
      print(" - " .. v.name)
    end
  end

  SendNUIMessage({
    type = 'showdialog',
    id = id,
    title = title,
    subtitle = subtitle,
    options = options
  })
  SetNuiFocus(true, true)
end)

RegisterNUICallback('close', function(data, cb)
  SetNuiFocus(false)
end)

RegisterNetEvent("ESRP_Dialog:SetNuiFocus")
AddEventHandler("ESRP_Dialog:SetNuiFocus", function()
  SetNuiFocus(false)
end)

RegisterNUICallback('choice', function(data, cb)
  if Config.Debug then
    print(data.dialogid)
  end
  TriggerServerEvent('ESRP_Dialog:UseOption', tonumber(data.dialogid), tonumber(data.optionid))
end)
