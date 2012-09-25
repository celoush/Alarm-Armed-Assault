private["_guard","_prisoners","_scriptname","_prisoner","_script","_return"];
_guard = _this select 0;
_prisoners = _this select 1;
_scriptname = _this select 2;

_prisoner = objnull;
while {isnull(_prisoner)} do {
  sleep 1;
  _prisoner = _guard findNearestEnemy getpos _guard;
};

try {
  if (!alive _guard) then {throw "guard dead"};
  _script = call compile format["[%1,%2,""know""] execVM ""%3""",_guard,_prisoner,_scriptname];
  _return = true;
}
catch {
  _return = false;
};
_return
