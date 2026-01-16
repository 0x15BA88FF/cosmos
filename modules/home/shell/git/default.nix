{
  pkgs,
  config,
  lib,
  ...
}:
let
  hooksPath = "${config.xdg.configHome}/git/hooks";
in
{
  options.modules.shell.git.enable = lib.mkEnableOption "Enable git";

  config = lib.mkIf config.modules.shell.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "0x15BA88FF";
          email = "86390213+0x15BA88FF@users.noreply.github.com";
        };
        core.hooksPath = hooksPath;
      };
    };
    home.file."${hooksPath}/pre-commit".source = "${
      import ./hooks/pre-commit.nix { inherit pkgs; }
    }/bin/pre-commit";
  };
}
