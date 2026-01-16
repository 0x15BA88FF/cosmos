{ config, lib, ... }:
{
  options.modules.shell.gemini-cli.enable = lib.mkEnableOption "Enable Gemini cli";

  config = lib.mkIf config.modules.shell.gemini-cli.enable {
    programs.gemini-cli.enable = true;
  };
}
