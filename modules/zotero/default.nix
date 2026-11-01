{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.zotero.enable = lib.mkEnableOption "Enable zotero";

  config = lib.mkIf config.modules.home.zotero.enable {
    home.packages = [ pkgs.zotero ];
  };
}
