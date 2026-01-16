{
  lib,
  pkgs,
  config,
  ...
}:
let
  username = "null";
in
{
  options.user.${username}.enable = lib.mkEnableOption "Enable user ${username}";

  config = lib.mkIf config.user.${username}.enable {
    programs.zsh.enable = true;

    users.users.${username} = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
        "input"
        "uinput"
      ];
    };
  };
}
