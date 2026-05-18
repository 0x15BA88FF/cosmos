{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.home.vscode.enable = lib.mkEnableOption "Enable vscode";

  config = lib.mkIf config.modules.home.vscode.enable {
    home.packages = [ pkgs.vscode ];
  };
}
