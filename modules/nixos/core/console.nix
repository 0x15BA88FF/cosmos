{ lib, config, ... }: {
  options.systemModules.console = {
    enable = lib.mkEnableOption "Enable console configuration";
    style.enable = lib.mkEnableOption "Enable console style";
  };

  config = lib.mkIf
    (config.systemModules.console.enable
      && config.systemModules.console.style.enable)
    {
      console = {
        colors = with config.style.colors.palette; [
          base00
          base08
          base0B
          base0A
          base0D
          base0E
          base0C
          base05

          base03
          base08
          base0B
          base0A
          base0D
          base0E
          base0C
          base07
        ];
      };
    };
}
