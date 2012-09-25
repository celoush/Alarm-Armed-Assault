private ["_unit","_alarm_type","_enemy","_deadman"];
_unit = _this select 0;
_alarm_type=_this select 2;
if (isnil "alarm") then {alarm=false;publicvariable "alarm"};
try {
  if (alarm) then {throw "alarm jiz spusten"};
  if (_alarm_type=="body") then {
    _deadman=_this select 1;
    if (random 1>0.5) then {
      _unit say "Shit_Man_Down";
    } else {
      _unit say "What_The_Hell";
    };
    _unit domove getpos _deadman;
    sleep 2+random 1;
    if (!alive _unit or alarm) then {throw "nespoustim alarm"};
    _unit say "Help_Here";
    sleep 2;
    alarm=true;
    publicvariable "alarm";
  };
  if (_alarm_type=="know") then {
    _enemy = _this select 1;
    _unit dowatch getpos _enemy;
    waituntil {_unit knowsabout _enemy > 0.5};
    _unit setbehaviour "AWARE";
    waituntil {_unit knowsabout _enemy > 1.5};
    _unit setbehaviour "COMBAT";
    if (random 1>0.5) then {
      _unit say "Contact";
    } else {
      _unit say "Enemy_Spotted";
    };
    sleep 2+random 1;
    if (!alive _unit or alarm) then {throw "nespoustim alarm"};
    _unit say "Help_Here";
    sleep 2;  
    alarm=true;
    publicvariable "alarm";
  };
  if (_alarm_type=="fire") then {
    sleep 2;
    alarm=true;
    publicvariable "alarm";
  };
  _return = true;
  if (alarm) then {
    {_x setbehaviour "COMBAT"} foreach hlidkujici;
    {_x setcombatmode "red"} foreach hlidkujici;
    if (alive _unit) then {{_x dowatch getpos _unit} foreach hlidkujici;}; 
    waituntil {({alive _x} count hlidkujici)<4};
    {_x domove getpos hlidka9} foreach hlidkujici;
  }
} catch {
  _return = false;
};
_return
