#include "HG_Macros.h"
/*
    Author - HoverGuy
    © All Fucks Reserved
*/
params["_target","_caller","_id","_storePoint"];
if((typeName _storePoint) != "STRING") exitWith {hint (localize "STR_HG_ERR_ON_LOAD_1");};
if(_storePoint isEqualTo "") exitWith {hint (localize "STR_HG_ERR_ON_LOAD_2");};

disableSerialization;

private _near = (nearestObjects [(markerPos _storePoint),["Car","Air","Tank","Boat"],8]) select {alive _x};

if((count _near) > 0) then
{
    private["_vehicle","_owner"];
	_vehicle = _near select 0;
    _owner = _vehicle getVariable "HG_Owner";
	if((_owner select 0) isEqualTo (getPlayerUID player)) then
	{
	    [player,_vehicle,(_owner select 1)] remoteExecCall ["HG_fnc_storeVehicleS",2,false];
	} else {
	    hint (localize "STR_HG_NO_OWNED_VEHICLES");
	};
} else {
    hint (localize "STR_HG_NO_VEHICLES");
};

true;