{ config, lib, ... }:
{
  options.modules.desktop.applications.brave.enable = lib.mkEnableOption "Enable brave";

  config = lib.mkIf config.modules.desktop.applications.brave.enable {
    programs.brave.enable = true;
  };
}
