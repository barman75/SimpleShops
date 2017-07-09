/*
    Author - HoverGuy
    © All Fucks Reserved
    Website - http://www.sunrise-production.com
*/
params["_unit","_id","_uid","_name","_all","_saveInv"];

_all = (allMissionObjects "LandVehicle") + (allMissionObjects "Air") + (allMissionObjects "Ship") + (allMissionObjects "Submarine");
_saveInv = (getNumber(missionConfigFile >> "CfgClient" >> "enableVehicleInventorySave")) isEqualTo 1;

if(!HG_SAVING_EXTDB) then
{
    _garage = profileNamespace getVariable[format["HG_Garage_%1",_uid],[]];
};
	
{
    if(alive _x) then
	{
		_owner = _x getVariable "HG_Owner";
		
		if((_owner select 0) isEqualTo _uid) then
		{
			_plate = _owner select 1;
			
			if(!HG_SAVING_EXTDB) then
			{
				_index = [_plate,_garage] call HG_fnc_findIndex;
				
			    if(_index != -1) then
			    {
				    (_garage select _index) set [2,0];
			    } else {
				    _garage pushBack [(typeOf _x),_plate,0];
			    };
		    } else {
				private _query = if(HG_SAVING_PROTOCOL isEqualTo "SQL") then
			    {
					_query = format["UPDATE HG_Vehicles SET Active = '%1' WHERE PID = '%2' AND Plate = '%3'",0,_uid,_plate];
			    } else {
					_query = format["HG_vehicleActiveUpdate:%1:%2:%3",0,_uid,_plate];
				};
				
				// Send update query here
			};
			
			if(_saveInv) then
			{
				[_x] call HG_fnc_getInventory;
			};
			
			deleteVehicle _x;
		};
	};
} forEach _all;
	
if(!HG_SAVING_EXTDB) then
{
    profileNamespace setVariable[format["HG_Garage_%1",_uid],_garage];
    saveProfileNamespace;
};
	
true;
	