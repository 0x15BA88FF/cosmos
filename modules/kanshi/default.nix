{ lib, config, ... }:
{
  options.modules.home.kanshi.enable = lib.mkEnableOption "Enable kanshi";

  config = lib.mkIf config.modules.home.kanshi.enable {
    services.kanshi = {
      enable = true;
      settings = [
        {
          profile.name = "undocked";
          profile.outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
          ];
        }
      ];
    };
  };
}