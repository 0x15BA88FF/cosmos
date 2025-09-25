{ style, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window.decorations = "buttonless";
      general.live_config_reload = true;

      font = {
        size = 11;
        normal = {
          family = style.fonts.monospace.name;
          style = "Bold";
        };
        bold = {
          family = style.fonts.monospace.name;
          style = "ExtraBold";
        };
        italic = {
          family = style.fonts.monospace.name;
          style = "Bold Italic";
        };
        bold_italic = {
          family = style.fonts.monospace.name;
          style = "ExtraBold Italic";
        };
      };

      colors = {
        primary = {
          background = "#${style.colors.palette.base00}";
          foreground = "#${style.colors.palette.base05}";
        };

        cursor = {
          text = "#${style.colors.palette.base05}";
          cursor = "#${style.colors.palette.base03}";
        };

        vi_mode_cursor = {
          text = "#${style.colors.palette.base05}";
          cursor = "#${style.colors.palette.base0B}";
        };

        search = {
          matches = {
            foreground = "#${style.colors.palette.base03}";
            background = "#${style.colors.palette.base0E}";
          };
          focused_match = {
            foreground = "#${style.colors.palette.base03}";
            background = "#${style.colors.palette.base0B}";
          };
        };

        footer_bar = {
          foreground = "#${style.colors.palette.base03}";
          background = "#${style.colors.palette.base05}";
        };

        hints = {
          start = {
            foreground = "#${style.colors.palette.base03}";
            background = "#${style.colors.palette.base0E}";
          };
          end = {
            foreground = "#${style.colors.palette.base03}";
            background = "#${style.colors.palette.base0E}";
          };
        };

        selection = {
          text = "#${style.colors.palette.base00}";
          background = "#${style.colors.palette.base0B}";
        };

        normal = {
          black = "#${style.colors.palette.base00}";
          red = "#${style.colors.palette.base08}";
          green = "#${style.colors.palette.base0B}";
          yellow = "#${style.colors.palette.base0A}";
          blue = "#${style.colors.palette.base0D}";
          magenta = "#${style.colors.palette.base0E}";
          cyan = "#${style.colors.palette.base0C}";
          white = "#${style.colors.palette.base05}";
        };

        bright = {
          black = "#${style.colors.palette.base00}";
          red = "#${style.colors.palette.base08}";
          green = "#${style.colors.palette.base0B}";
          yellow = "#${style.colors.palette.base0A}";
          blue = "#${style.colors.palette.base0D}";
          magenta = "#${style.colors.palette.base0E}";
          cyan = "#${style.colors.palette.base0C}";
          white = "#${style.colors.palette.base07}";
        };

        dim = {
          black = "#${style.colors.palette.base00}";
          red = "#${style.colors.palette.base08}";
          green = "#${style.colors.palette.base0B}";
          yellow = "#${style.colors.palette.base0A}";
          blue = "#${style.colors.palette.base0D}";
          magenta = "#${style.colors.palette.base0E}";
          cyan = "#${style.colors.palette.base0C}";
          white = "#${style.colors.palette.base03}";
        };
      };
    };
  };
}
