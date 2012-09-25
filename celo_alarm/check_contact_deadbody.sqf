private ["_return","_guard","_deadbody","_deadman","_scriptname","_script"];

_guard = _this select 0;
_deadbody = _this select 1;
_deadman = _this select 2;
_scriptname = _this select 3;

waitUntil {(_guard knowsabout _deadbody>celo_alarm_contact_body) or (!alive _guard) or ((getpos _deadman select 2) < -0.3)};
try {
  if (!alive _guard) then {throw "guard dead"};
  if ((getpos _deadman select 2) < -0.3) then {throw "hide body"};
  _script = call compile format["[%1,%2,""body""] execVM ""%3""",_guard,_deadman,_scriptname];
  _return = true;
} catch {
  _return = false;
};
_return
