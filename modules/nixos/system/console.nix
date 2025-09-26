{ lib, config, ... }:
let
  palette = config.style.colors.palette;
  fonts = config.style.fonts;
in
{
  config = lib.mkIf config.style.enable {
    console = {
      font = fonts.console.name;
      colors = with palette; [
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
