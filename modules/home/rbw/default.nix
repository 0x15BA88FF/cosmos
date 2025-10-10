{ pkgs, ... }: {
  home.programs.rbw = {
    enable = true;
    settings.pinentry = pkgs.pinentry-gnome3;
  };
}
