private ["_unit","_gun","_scriptname","_return","_script"];
_unit = _this select 0;
_gun = _this select 1;
_scriptname = _this select 2;

try {
  if (format ["%1",typeName celo_alarm_silent_weapons]!="ARRAY") then {throw "isnt array"};
  if (_gun in celo_alarm_silent_weapons) then {throw "silent gun"};
  _script = call compile format["[%1,%2,""fire""] execVM ""%3""",_unit,format["""%1""",_gun],_scriptname];
  _return = true;
} catch {
  if (_exception == "isnt array") then {hint "Error - celo_alarm_silent_weapons isnt ARRAY"};
  _return = false;
};
_return
