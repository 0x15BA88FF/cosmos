{ config, lib, pkgs, styleLib, ... }:
let
  palette = config.style.colors.palette;
  fontName = config.style.fonts.sansSerif.name;

  grubFont = pkgs.runCommand "grub-font"
    {
      buildInputs = [ pkgs.grub2 pkgs.fontconfig ];
    } ''
    mkdir -p $out
    fontFile=$(${pkgs.fontconfig}/bin/fc-match ${
      lib.escapeShellArg fontName
    } --format=%{file})
    grub-mkfont --output="$out/mono.pf2" --size=14 "$fontFile"
  '';

  mkPng = color: name:
    pkgs.runCommand "${name}.png" { buildInputs = [ pkgs.imagemagick ]; } ''
      magick -size 1x1 "xc:${color}" -depth 8 PNG8:$out
    '';

  themeConfig = pkgs.writeText "theme.txt" ''
    desktop-image: "background.png"
    desktop-image-scale-method: "crop"
    desktop-color: "${styleLib.colorToHexString palette.base00}"

    terminal-font: "mono"
    terminal-left: "0"
    terminal-top: "0"
    terminal-width: "100%"
    terminal-height: "100%"

    + boot_menu {
      left = 25%
      top = 30%
      width = 50%
      height = 40%
      item_font = "mono"
      item_color = "${styleLib.colorToHexString palette.base05}"
      selected_item_color = "${styleLib.colorToHexString palette.base00}"
      item_height = 30
      item_padding = 10
      item_spacing = 2
      selected_item_pixmap_style = "selected_*.png"
      scrollbar = true
      scrollbar_width = 20
      scrollbar_thumb = "slider_*.png"
    }

    + progress_bar {
      id = "__timeout__"
      left = 25%
      top = 75%
      width = 50%
      height = 20
      font = "mono"
      text_color = "${styleLib.colorToHexString palette.base05}"
      fg_color = "${styleLib.colorToHexString palette.base0D}"
      bg_color = "${styleLib.colorToHexString palette.base02}"
      border_color = "${styleLib.colorToHexString palette.base03}"
    }

    + label {
      id = "__timeout__"
      text = "Booting in %d seconds"
      left = 25%
      top = 72%
      width = 50%
      height = 20
      align = "center"
      font = "mono"
      color = "${styleLib.colorToHexString palette.base05}"
    }
  '';

  cosmic-grub =
    pkgs.runCommand "grub-theme" { buildInputs = [ pkgs.imagemagick ]; } ''
      mkdir -p $out
      cp ${grubFont}/mono.pf2 $out/
      cp ${themeConfig} $out/theme.txt

      magick -size 1920x1080 "xc:${
        styleLib.colorToHexString palette.base00
      }" -depth 8 PNG8:$out/background.png

      ${lib.concatStringsSep "\n" (map (suffix:
        "cp ${
          mkPng "${styleLib.colorToHexString palette.base0D}"
          "selected_${suffix}"
        } $out/selected_${suffix}.png") [
          "c"
          "n"
          "s"
          "e"
          "w"
          "ne"
          "nw"
          "se"
          "sw"
        ])}

      ${lib.concatStringsSep "\n" (map (suffix:
        "cp ${
          mkPng "${styleLib.colorToHexString palette.base03}" "slider_${suffix}"
        } $out/slider_${suffix}.png") [
          "c"
          "n"
          "s"
          "e"
          "w"
          "ne"
          "nw"
          "se"
          "sw"
        ])}
    '';
in
{
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    theme = cosmic-grub;
    backgroundColor = "${styleLib.colorToHexString palette.base00}";
    splashImage = mkPng "${styleLib.colorToHexString palette.base00}" "splash";
  };
}
