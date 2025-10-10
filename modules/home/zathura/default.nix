{ ... }: {
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      selection-clipboard = "clipboard";
    };
  };

  stylix.targets.zathura.enable = true;
}
