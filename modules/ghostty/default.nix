{ lib, config, ... }:
{
  options.modules.home.ghostty.enable = lib.mkEnableOption "Enable ghostty";

  config = lib.mkIf config.modules.home.ghostty.enable {
    programs.ghostty.enable = true;
  };
}
