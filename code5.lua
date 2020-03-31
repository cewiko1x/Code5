RegisterCommand("code5", function(source, args, raw)
    local pedestrian = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsUsing(pedestrian)
    local lastVehicle = GetPlayersLastVehicle()
    local distanceToVehicle = GetDistanceBetweenCoords(GetEntityCoords(pedestrian), GetEntityCoords(lastVehicle), 1)
    
        door = 0

    if door ~= nil then
        if IsPedInAnyVehicle(pedestrian, false) then
            if GetVehicleDoorAngleRatio(vehicle, door) > 0 then
                SetVehicleDoorShut(vehicle, door, false)
                TriggerEvent("Cruiser door closed.")
            else	
                SetVehicleDoorOpen(vehicle, door, false, false)
                TriggerEvent("Cruiser door opened.")
            end
        else
            if distanceToVehicle < 4 then
                if GetVehicleDoorAngleRatio(lastVehicle, door) > 0 then
                    SetVehicleDoorShut(lastVehicle, door, false)
                    TriggerEvent("Cruiser door closed.")
                else	
                    SetVehicleDoorOpen(lastVehicle, door, false, false)
                    TriggerEvent("Cruiser door opened.")
                end
            else
                TriggerEvent("Too far away from your cruiser.")
            end
        end
    end
end)