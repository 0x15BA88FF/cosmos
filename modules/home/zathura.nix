{ style, styleLib, ... }:
let palette = style.colors.palette;
in
{
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      selection-clipboard = "clipboard";

      default-fg = palette.base05;
      default-bg = palette.base00;

      completion-bg = palette.base01;
      completion-fg = palette.base05;
      completion-group-bg = palette.base01;
      completion-group-fg = palette.base05;
      completion-highlight-bg = palette.base01;
      completion-highlight-fg = palette.base0B;

      statusbar-fg = palette.base05;
      statusbar-bg = palette.base01;

      notification-bg = palette.base01;
      notification-fg = palette.base05;
      notification-error-bg = palette.base01;
      notification-error-fg = palette.base08;
      notification-warning-bg = palette.base01;
      notification-warning-fg = palette.base0A;

      inputbar-fg = palette.base05;
      inputbar-bg = palette.base01;

      recolor-darkcolor = palette.base05;
      recolor-lightcolor = palette.base00;

      index-fg = palette.base05;
      index-bg = palette.base00;
      index-active-fg = palette.base05;
      index-active-bg = palette.base01;

      render-loading-bg = palette.base00;
      render-loading-fg = palette.base05;

      highlight-fg = "rgba(${styleLib.colorToRgbString palette.base0E}, 0.5)";
      highlight-color =
        "rgba(${styleLib.colorToRgbString palette.base0E}, 0.5)";
      highlight-active-color =
        "rgba(${styleLib.colorToRgbString palette.base0B}, 0.5)";
    };
  };
}

