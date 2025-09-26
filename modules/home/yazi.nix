{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    settings.mgr.ratio = [ 2 2 4 ];
    keymap.mgr.prepend_keymap = [
      # {
      #   run = "plugin system-clipboard";
      #   dec = "Copy into clipboard";
      #   on = [ "c" "y" ];
      # }
      {
        run = "shell 'cb clear & cb copy \"$@\"'";
        dec = "Copy into clipboard";
        on = [ "c" "y" ];
      }
      {
        run = "plugin mount";
        dec = "Mount drive";
        on = [ "M" ];
      }
      {
        run = "plugin recycle-bin";
        desc = "Open Recycle Bin";
        on = [ "R" "b" ];
      }
    ];
    plugins = {
      recycle-bin = pkgs.yaziPlugins.recycle-bin;
      mount = pkgs.yaziPlugins.mount;
    };
  };
  home.packages = with pkgs; [ clipboard-jh trash-cli ];
}


