{ config, lib, ... }:
{
  options.modules.home.brave.enable = lib.mkEnableOption "Enable brave";

  config = lib.mkIf config.modules.home.brave.enable {
    programs.brave.enable = true;
  };
}
