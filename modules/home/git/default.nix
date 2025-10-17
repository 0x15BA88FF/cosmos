{ config, pkgs, ... }:
let
  hooksPath = "${config.xdg.configHome}/git/hooks";
in
{
  imports = [ ./scripts/default.nix ];

  programs.git = {
    enable = true;
    userName = "0x15BA88FF";
    userEmail = "86390213+0x15BA88FF@users.noreply.github.com";
    extraConfig.core.hooksPath = hooksPath;
  };

  home.file."${hooksPath}/pre-commit".source = "${
    import ./hooks/pre-commit.nix { inherit pkgs; }
  }/bin/pre-commit";
}
