private ["_guard","_guards","_scriptname","_deadbody"];
_guard = _this select 0;
_guards = _this select 1;
_scriptname = _this select 2;

waitUntil {!alive _guard};

_deadbody="Grave" createvehicle [0,0,100];
_deadbody setpos [getpos _guard select 0,getpos _guard select 1,-1];

{if (alive (_x)) then {[_x,_deadbody,_guard,_scriptname] execVM "celo_alarm\check_contact_deadbody.sqf"}} foreach _guards;
true
