{ pkgs, ... }:
let username = "null";
in
{
  imports = [ ./../../modules/home/default.nix ];

  programs.home-manager.enable = true;

  home = {
    username = username;
    stateVersion = "25.05";
    homeDirectory = "/home/${username}";
    sessionPath = [ "$HOME/.local/bin" ];
    packages = with pkgs; [ chromium discord zoom-us ];
  };

  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
}
