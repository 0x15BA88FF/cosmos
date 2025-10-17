{ pkgs, ... }:
{
  programs.mpv.enable = true;

  home.packages = [ pkgs.mpvScripts.mpris ];
}
