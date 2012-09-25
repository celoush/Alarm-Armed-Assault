_soldiers = _this select 0;
_script = call compile format["{_x addeventhandler[""fired"",{[_this select 0,_this select 4,""%1""] execVM ""celo_alarm\check_fire_soldier.sqf""}]} foreach _soldiers",_this select 1];
true
