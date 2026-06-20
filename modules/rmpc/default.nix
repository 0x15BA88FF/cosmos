{
  lib,
  config,
  ...
}:
{
  options.modules.home.rmpc.enable = lib.mkEnableOption "Enable rmpc";

  config = lib.mkIf config.modules.home.rmpc.enable {
    programs.rmpc.enable = true;
  };
}
