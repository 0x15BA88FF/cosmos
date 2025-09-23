{ pkgs, lib, config, inputs, ... }: {
  options.style = {
    enable = lib.mkEnableOption "Global style library";

    image = lib.mkOption {
      type = lib.types.str;
      description = "Background Image";
    };

    variant = lib.mkOption {
      type = lib.types.enum [ "light" "dark" ];
      default = "dark";
      description = "Style variant";
    };

    opacity = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
      description = "Opacity between 0.0 and 1.0";
    };

    border = lib.mkOption {
      type = lib.types.int;
      default = 1;
      description = "Base border width";
    };

    rounded = lib.mkOption {
      type = lib.types.attrsOf lib.types.int;
      default = {
        sm = 2;
        md = 4;
        lg = 8;
        xl = 12;
      };
      description = "Border radius";
    };
  };

  config = lib.mkIf config.style.enable {
    style = {
      image = config.style.image;
      border = config.style.border;
      opacity = config.style.opacity;
      variant = config.style.variant;
      colors = inputs.nix-colors.colorSchemes.dracula;

      rounded = {
        sm = config.style.rounded.sm;
        md = config.style.rounded.md;
        lg = config.style.rounded.lg;
        xl = config.style.rounded.xl;
      };

      fonts = {
        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Serif";
        };

        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };

        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };

        proportional = {
          package = pkgs.nerd-fonts.jetbrains-mono.override {
            variant = "proportional";
          };
          name = "JetBrainsMono Nerd Font Propo";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };

        cjkSerif = {
          package = pkgs.noto-fonts-cjk-serif;
          name = "Noto Serif CJK SC";
        };

        cjkSansSerif = {
          package = pkgs.noto-fonts-cjk-sans;
          name = "Noto Sans CJK SC";
        };

        extra = {
          package = pkgs.noto-fonts-extra;
          name = "Noto Symbols";
        };
      };
    };

    fonts.packages =
      lib.attrValues (lib.mapAttrs (_: v: v.package) config.style.fonts);
  };
}
