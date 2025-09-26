{ style, styleLib, ... }:
let
  palette = style.colors.palette;
  fonts = style.fonts;
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window.decorations = "buttonless";
      general.live_config_reload = true;

      font = {
        size = 11;
        normal = {
          family = fonts.monospace.name;
          style = "Bold";
        };
        bold = {
          family = fonts.monospace.name;
          style = "ExtraBold";
        };
        italic = {
          family = fonts.monospace.name;
          style = "Bold Italic";
        };
        bold_italic = {
          family = fonts.monospace.name;
          style = "ExtraBold Italic";
        };
      };

      colors = {
        primary = {
          background = styleLib.colorToHexString palette.base00;
          foreground = styleLib.colorToHexString palette.base05;
        };

        cursor = {
          text = styleLib.colorToHexString palette.base05;
          cursor = styleLib.colorToHexString palette.base03;
        };

        vi_mode_cursor = {
          text = styleLib.colorToHexString palette.base05;
          cursor = styleLib.colorToHexString palette.base0B;
        };

        search = {
          matches = {
            foreground = styleLib.colorToHexString palette.base03;
            background = styleLib.colorToHexString palette.base0E;
          };
          focused_match = {
            foreground = styleLib.colorToHexString palette.base03;
            background = styleLib.colorToHexString palette.base0B;
          };
        };

        footer_bar = {
          foreground = styleLib.colorToHexString palette.base03;
          background = styleLib.colorToHexString palette.base05;
        };

        hints = {
          start = {
            foreground = styleLib.colorToHexString palette.base03;
            background = styleLib.colorToHexString palette.base0E;
          };
          end = {
            foreground = styleLib.colorToHexString palette.base03;
            background = styleLib.colorToHexString palette.base0E;
          };
        };

        selection = {
          text = styleLib.colorToHexString palette.base00;
          background = styleLib.colorToHexString palette.base0B;
        };

        normal = {
          black = styleLib.colorToHexString palette.base00;
          red = styleLib.colorToHexString palette.base08;
          green = styleLib.colorToHexString palette.base0B;
          yellow = styleLib.colorToHexString palette.base0A;
          blue = styleLib.colorToHexString palette.base0D;
          magenta = styleLib.colorToHexString palette.base0E;
          cyan = styleLib.colorToHexString palette.base0C;
          white = styleLib.colorToHexString palette.base05;
        };

        bright = {
          black = styleLib.colorToHexString palette.base00;
          red = styleLib.colorToHexString palette.base08;
          green = styleLib.colorToHexString palette.base0B;
          yellow = styleLib.colorToHexString palette.base0A;
          blue = styleLib.colorToHexString palette.base0D;
          magenta = styleLib.colorToHexString palette.base0E;
          cyan = styleLib.colorToHexString palette.base0C;
          white = styleLib.colorToHexString palette.base07;
        };

        dim = {
          black = styleLib.colorToHexString palette.base00;
          red = styleLib.colorToHexString palette.base08;
          green = styleLib.colorToHexString palette.base0B;
          yellow = styleLib.colorToHexString palette.base0A;
          blue = styleLib.colorToHexString palette.base0D;
          magenta = styleLib.colorToHexString palette.base0E;
          cyan = styleLib.colorToHexString palette.base0C;
          white = styleLib.colorToHexString palette.base03;
        };
      };
    };
  };
}
