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
    programs = {
      localsend.enable = true;
      nix-ld.enable = true;
      sway = {
        enable = true;
        extraPackages = [ ];
      };
      zsh.enable = true;
    };

    users.users.${username} = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
        "uinput"
        "docker"
        "networkmanager"
      ];
    };
  };
}
