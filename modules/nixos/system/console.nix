{ lib, config, ... }: {
  config = lib.mkIf config.style.enable {
    console = {
      font = config.style.fonts.console.name;
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
