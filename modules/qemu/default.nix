{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.qemu.enable = lib.mkEnableOption "Enable qemu";

  config = lib.mkIf config.modules.home.qemu.enable {
    home.packages = [
      pkgs.qemu
      pkgs.quickemu
    ];
  };
}
