{ lib, ... }:
{
  imports = [
    ./ssh
    ./zsh
    ./git
    ./nvim
    ./tmux
    ./btop
    ./atuin
    ./devctl
    ./direnv
    ./notectl
    ./starship
    ./gemini-cli
  ];

  modules.shell.ssh.enable = lib.mkDefault true;
  modules.shell.zsh.enable = lib.mkDefault true;
  modules.shell.git.enable = lib.mkDefault true;
  modules.shell.nvim.enable = lib.mkDefault true;
  modules.shell.tmux.enable = lib.mkDefault true;
  modules.shell.btop.enable = lib.mkDefault true;
  modules.shell.atuin.enable = lib.mkDefault true;
  modules.shell.devctl.enable = lib.mkDefault true;
  modules.shell.direnv.enable = lib.mkDefault true;
  modules.shell.notectl.enable = lib.mkDefault true;
  modules.shell.starship.enable = lib.mkDefault true;
  modules.shell.gemini-cli.enable = lib.mkDefault true;
}
