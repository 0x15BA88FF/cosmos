{ pkgs, lib, inputs, config, ... }:
let cfg = config.style;
in
{
  options.style = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable global style library";
    };
    image = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Background image";
    };
    colors = lib.mkOption {
      type = lib.types.attrs;
      default = inputs.nix-colors.colorSchemes.gruvbox-light-hard;
      description = "Color scheme";
    };
    opacity = lib.mkOption {
      type = lib.types.float;
      default = 9.0;
      description = "Opacity between 0.0 and 1.0";
    };
    border = lib.mkOption {
      type = lib.types.int;
      default = 1;
      description = "Base border width in px";
    };
    rounded = lib.mkOption {
      type = lib.types.attrsOf lib.types.int;
      default = {
        sm = 2;
        md = 4;
        lg = 8;
        xl = 12;
      };
      description = "Border radii";
    };
    fontSizes = lib.mkOption {
      type = lib.types.attrsOf lib.types.int;
      default = {
        xs = 10;
        sm = 11;
        base = 12;
        md = 14;
        lg = 16;
        xl = 18;
      };
      description = "Font size variants";
    };
    fonts = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          package = lib.mkOption { type = lib.types.nullOr lib.types.package; };
          name = lib.mkOption { type = lib.types.nullOr lib.types.str; };
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
          package = pkgs.nerd-fonts.jetbrains-mono;
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
        console = {
          package = null;
          name = null;
        };
      };
      description = "Font families and their packages.";
    };
  };

  config = lib.mkIf cfg.enable {
    _module.args.styleLib = rec {
      colorToAttrSet = color:
        let
          cleanHex = lib.removePrefix "#" color;
          paddedHex =
            if builtins.stringLength cleanHex < 6 then
              lib.strings.fixedWidthString 6 "0" cleanHex
            else
              cleanHex;
          r = (lib.fromHexString (builtins.substring 0 2 paddedHex)) / 255.0;
          g = (lib.fromHexString (builtins.substring 2 2 paddedHex)) / 255.0;
          b = (lib.fromHexString (builtins.substring 4 2 paddedHex)) / 255.0;
        in
        { inherit r g b; };
      colorToHexString = color: "#${color}";
      colorToRgbString = color:
        let attr = colorToAttrSet color;
        in "${toString attr.r}, ${toString attr.g}, ${toString attr.b}";
    };
  };
}
