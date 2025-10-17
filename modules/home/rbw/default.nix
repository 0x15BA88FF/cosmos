{ pkgs, ... }:
{
  programs.rbw = {
    enable = true;
    settings = {
      pinentry = pkgs.pinentry-gtk2;
      email = "15ba88+bitwarden@proton.me";
    };
  };

  home.packages = [ pkgs.rofi-rbw ];
}
