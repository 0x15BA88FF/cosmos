{ config, lib, ... }:
{
  options.modules.home.starship.enable = lib.mkEnableOption "Enable starship";

  config = lib.mkIf config.modules.home.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        format = " $username$hostname$directory$nix_shell$direnv$character";
        right_format = "$git_branch$git_status$kubernetes$docker_context$c$cpp$cmake$java$deno$c$lua$rust$golang$nodejs$python$cmd_duration";
        hostname.ssh_symbol = "󱘖 ";
        directory.read_only = "  ";
        nix_shell.symbol = "󱄅 ";
      };
    };
  };
}
