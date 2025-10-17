{
  config,
  lib,
  pkgs,
  ...
}:
let
  username = "null";
in
{
  options.user.${username}.enable = lib.mkEnableOption "Enable user ${username}";

  config = lib.mkIf config.user.${username}.enable {
    age.secrets."password-user-${username}".file = ../../secrets/password-user-${username}.age;

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
      hashedPasswordFile = config.age.secrets."password-user-${username}".path;
    };
  };
}
