{ style, ... }:
let palette = style.colors.palette;
in
{
  programs.imv = {
    enable = true;
    settings.options = {
      background = "${palette.base00}";
      overlay_text_color = "${palette.base05}";
      overlay_background_color = "${palette.base00}";
    };
  };
}
