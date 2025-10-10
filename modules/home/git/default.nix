{ config, pkgs, ... }:
let hooksPath = "${config.home.homeDirectory}/.config/git/hooks";
in
{
  programs.git = {
    enable = true;
    userName = "0x15BA88FF";
    userEmail = "86390213+0x15BA88FF@users.noreply.github.com";
    extraConfig.core.hooksPath = hooksPath;
  };

  home.file."${hooksPath}/pre-commit".source = "${
      import ./scripts/git-hooks/pre-commit.nix { inherit pkgs; }
    }/bin/pre-commit";
}
