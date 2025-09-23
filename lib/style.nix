{ pkgs, lib, config, inputs, ... }:

{
  options.style = {
    enable = lib.mkEnableOption "Global style library";

    image = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Background image path or URL.";
    };

    colors = lib.mkOption {
      type = lib.types.attrs;
      default = inputs.nix-colors.colorSchemes.dracula;
      description = "Color scheme.";
    };

    variant = lib.mkOption {
      type = lib.types.enum [ "light" "dark" ];
      default = "dark";
      description = "Light or dark variant.";
    };

    opacity = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
      description = "Opacity between 0.0 and 1.0.";
    };

    border = lib.mkOption {
      type = lib.types.int;
      default = 1;
      description = "Base border width in px.";
    };

    rounded = lib.mkOption {
      type = lib.types.attrsOf lib.types.int;
      default = {
        sm = 2;
        md = 4;
        lg = 8;
        xl = 12;
      };
      description = "Border radii.";
    };

    fonts = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          package = lib.mkOption { type = lib.types.package; };
          name = lib.mkOption { type = lib.types.str; };
        };
      });
      default = {
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
      description = "Font families and their packages.";
    };
  };

  config = lib.mkIf config.style.enable {
    fonts.packages =
      lib.attrValues (lib.mapAttrs (_: v: v.package) config.style.fonts);
  };
}
