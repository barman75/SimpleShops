#include "HG_Macros.h"
/*
    Author - HoverGuy
    © All Fucks Reserved
*/

disableSerialization;

HG_GARAGE_BACK ctrlSetText (localize "STR_HG_GRG_VEHICLE_DELETING");

{
    _x ctrlShow false;
} forEach [HG_GARAGE_LIST,HG_GARAGE_REFRESH_BTN,HG_GARAGE_SPAWN_BTN,HG_GARAGE_DELETE_BTN];

[player,(HG_GARAGE_LIST lbValue (lbCurSel HG_GARAGE_LIST))] remoteExecCall ["HG_fnc_deleteVehicle",2,false];

[] call HG_fnc_refreshGarage;

true;