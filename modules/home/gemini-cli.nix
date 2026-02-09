{ config, lib, ... }:
{
  options.modules.home.gemini-cli.enable = lib.mkEnableOption "Enable Gemini cli";

  config = lib.mkIf config.modules.home.gemini-cli.enable {
    programs.gemini-cli.enable = true;
  };
}
