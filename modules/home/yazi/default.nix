{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    settings.mgr.ratio = [ 1 2 4 ];
    keymap.mgr.prepend_keymap = [
      {
        run = "shell 'cpfile \"$@\"'";
        dec = "Copy into clipboard";
        on = [ "c" "c" ];
      }
      {
        run = "plugin mount";
        dec = "Mount drive";
        on = [ "M" ];
      }
      {
        run = "plugin recycle-bin";
        desc = "Open Recycle Bin";
        on = [ "R" ];
      }
    ];
    plugins = {
      mount = pkgs.yaziPlugins.mount;
      recycle-bin = pkgs.yaziPlugins.recycle-bin;
    };
  };

  home.packages = with pkgs;
    [
      fd
      jq
      fzf
      file
      p7zip
      resvg
      ffmpeg
      poppler
      trash-cli
      imagemagick
      wl-clipboard
    ] ++ import ./scripts/default.nix { inherit pkgs; };

  stylix.targets.yazi.enable = true;
}

