/*
 * vxf_interaction_fnc_leverAnimate
 *
 * interaction button animate lever/switch functionality
 */

#include "../interactDefines.hpp"

params ["_vehicle", "_animation", "_animationTarget", "_animationTargetLabel", "_animationSpeed", "_animStart", "_animEnd", "_button"];

if (isNil{_vehicle getVariable "vxf_interaction"}) exitWith {false};
if (_animation in vxf_animating_keys) exitWith {false};

_button PARAMS;
diag_log format ["%2: lever animate %1", _name, time];

if(!(_this call compile _interactCondition)) exitWith {
  [] call vxf_interaction_fnc_attemptCloseActionMenu;
};

if (_clickSound != "") then {playSound _clickSound};

[_vehicle, _animation, _animationTargetLabel, _animationTarget] call _animStart;
[_vehicle, _position, 1, name player] call vxf_interaction_fnc_pointNetSend;
vxf_animating_keys pushBack _animation;

_vehicle animateSource [_animation, _animationTarget, _animationSpeed];
[_vehicle, _animation, _animationTarget, _animationTargetLabel, _animEnd] spawn {
  params ["_vehicle", "_animation", "_animationTarget", "_animationTargetLabel", "_animEnd"];
  private _startTime = cba_missionTime;
  [] call vxf_interaction_fnc_attemptCloseActionMenu;
  waitUntil {
    cba_missionTime > _startTime + 3 ||
    ((_vehicle animationPhase _animation > _animationTarget - 0.02) && (_vehicle animationPhase _animation < _animationTarget + 0.02))};
  [_vehicle, _animation, _animationTargetLabel, _animationTarget] call _animEnd;
  vxf_animating_keys deleteAt (vxf_animating_keys find _animation);
};
