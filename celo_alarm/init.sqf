private["_guards","_prisoners","_scriptname"];
_guards = _this select 0;
_prisoners = _this select 1;
_scriptname = _this select 2;
try {
  if (format ["%1",typeName _guards]!="ARRAY") then {throw "bad first parametr"};
  if ((count _guards)==0) then {throw "first parametr empty"};
  if (format ["%1",typeName _prisoners]!="ARRAY") then {throw "bad second parametr"};
  if ((count _prisoners)==0) then {throw "second parametr empty"};
  if (format ["%1",typeName _scriptname]!="STRING") then {throw "bad script parametr"};
  if (_scriptname=="") then {throw "script parametr empty"};
  _script = [] execVM "celo_alarm\config.sqf";
  {_script = [_x,_prisoners,_scriptname] execVM "celo_alarm\check_contact_soldiers.sqf"} foreach _guards;
  {_script = [_x,_guards-[_x],_scriptname] execVM "celo_alarm\check_contact_deadbody_soldiers.sqf"} foreach _guards;
  _script = [_prisoners+_guards,_scriptname] execVM "celo_alarm\check_fire.sqf";
  _return=true;
} catch {
  if (_exception == "bad first parametr") then {hint "First parametr isnt array"}; 
  if (_exception == "bad second parametr") then {hint "Second parametr isnt array"}; 
  if (_exception == "bad script parametr") then {hint "Third parametr isnt string"}; 
  if (_exception == "script parametr empty") then {hint "Name of script is empty"}; 
  _return = false;
};
_return
