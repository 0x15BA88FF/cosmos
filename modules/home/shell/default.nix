{ lib, ... }:
{
  imports = [
    ./zsh/default.nix
    ./nnn/default.nix
    ./git/default.nix
    ./nvim/default.nix
    ./tmux/default.nix
    ./btop/default.nix
    ./atuin/default.nix
    ./devctl/default.nix
    ./notectl/default.nix
    ./starship/default.nix
  ];

  modules.shell.zsh.enable = lib.mkDefault true;
  modules.shell.nnn.enable = lib.mkDefault true;
  modules.shell.git.enable = lib.mkDefault true;
  modules.shell.nvim.enable = lib.mkDefault true;
  modules.shell.tmux.enable = lib.mkDefault true;
  modules.shell.btop.enable = lib.mkDefault true;
  modules.shell.atuin.enable = lib.mkDefault true;
  modules.shell.devctl.enable = lib.mkDefault true;
  modules.shell.notectl.enable = lib.mkDefault true;
  modules.shell.starship.enable = lib.mkDefault true;
}
