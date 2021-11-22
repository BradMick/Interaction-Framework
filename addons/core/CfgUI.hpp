class RVAR(EngineOn) {
  condition = QUOTE(!(isEngineOn (vehicle hatchet_player)));
  label = "$str_action_engineon";
  radius = 0.3;
  buttonDown = QUOTE(vehicle hatchet_player engineOn true);
  action = "EngineOn";
};

class RVAR(EngineOff) {
  condition = QUOTE(isEngineOn (vehicle hatchet_player));
  label = "$str_action_engineoff";
  radius = 0.3;
  buttonDown = QUOTE(vehicle hatchet_player engineOn false);
  action = "EngineOff";
};

class RVAR(LightOn) {
  condition = QUOTE(!(isLightOn (vehicle hatchet_player)));
  label = "$STR_ACTION_LIGHTS_ON";
  radius = 0.3;
  buttonDown = QUOTE(vehicle hatchet_player setPilotLight true);
  action = "LightOn";
};

class RVAR(LightOff) {
  condition = QUOTE(isLightOn (vehicle hatchet_player));
  label = "$STR_ACTION_LIGHTS_OFF";
  radius = 0.3;
  buttonDown = QUOTE(vehicle hatchet_player setPilotLight false);
  action = "LightOff";
};
