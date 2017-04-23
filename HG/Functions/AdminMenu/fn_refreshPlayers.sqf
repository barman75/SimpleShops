#include "HG_Macros.h"
/*
    Author - HoverGuy
    © All Fucks Reserved
    Website - http://www.sunrise-production.com
*/
private["_all","_ind"];

disableSerialization;

HG_TEMP = [];

lbClear HG_ADM_LIST;
HG_ADM_REFRESH ctrlEnable false;
	
_all = (allPlayers - entities 'HeadlessClient_F') select {alive _x};

HG_ADM_COUNT ctrlSetText format[(localize "STR_HG_DLG_PLAYER_COUNT"),(count _all)];
	
if((count _all) != 0) then
{
    HG_TEMP = _all;
	
	{
		_ind = HG_ADM_LIST lbAdd format[(localize "STR_HG_DLG_AM_LIST"),(name _x),(getPlayerUID _x)];
		HG_ADM_LIST lbSetData [_ind,(typeOf _x)];
		HG_ADM_LIST lbSetValue [_ind,_forEachIndex];
	} forEach _all;
	
	{
	    _x ctrlEnable true;
	} forEach [HG_ADM_COMB,HG_ADM_KILL,HG_ADM_RANK,HG_ADM_XP,HG_ADM_KILLS,HG_ADM_CASH,HG_ADM_XP_EDIT,HG_ADM_KILLS_EDIT,HG_ADM_CASH_EDIT,HG_ADM_XP_SUB,HG_ADM_KILLS_SUB,HG_ADM_CASH_SUB,HG_ADM_XP_ADD,HG_ADM_KILLS_ADD,HG_ADM_CASH_ADD];
} else {
    _ind = HG_ADM_LIST lbAdd (localize "STR_HG_NOTHING_TO_DISPLAY");
	HG_ADM_LIST lbSetData[_ind,(localize "STR_HG_NONE")];
	
	{
	    _x ctrlEnable false;
	} forEach [HG_ADM_COMB,HG_ADM_KILL,HG_ADM_RANK,HG_ADM_XP,HG_ADM_KILLS,HG_ADM_CASH,HG_ADM_XP_EDIT,HG_ADM_KILLS_EDIT,HG_ADM_CASH_EDIT,HG_ADM_XP_SUB,HG_ADM_KILLS_SUB,HG_ADM_CASH_SUB,HG_ADM_XP_ADD,HG_ADM_KILLS_ADD,HG_ADM_CASH_ADD];
};

HG_ADM_REFRESH ctrlEnable true;
HG_ADM_LIST lbSetCurSel 0;

true;
