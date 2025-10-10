{ pkgs, ... }:
let
  mpvOscModern = pkgs.fetchzip {
    url =
      "https://github.com/maoiscat/mpv-osc-modern/archive/refs/tags/v1.1.1.tar.gz";
    sha256 = "sha256-RMUy8UpSRSCEPAbnGLpJ2NjDsDdkjq8cNsdGwsQ5ANU=";
  };
in
{
  programs.mpv.enable = true;

  xdg.configFile = {
    "mpv/scripts/modern.lua".source = "${mpvOscModern}/modern.lua";
    "mpv/fonts/Material-Design-Iconic-Font.ttf".source =
      "${mpvOscModern}/Material-Design-Iconic-Font.ttf";
  };

  home.packages = with pkgs; [ mpvScripts.mpris ];
}
