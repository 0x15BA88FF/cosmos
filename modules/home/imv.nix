{ style, ... }: {
  xdg.configFile."imv/config".text = ''
    [options]
    background=${style.colors.palette.base00}
    overlay_text_color=${style.colors.palette.base05}
    overlay_background_color=#${style.colors.palette.base00}
  '';
}
