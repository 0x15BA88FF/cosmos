{ config, lib, ... }: {
  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.dataHome}/shell/history/bash";
  };
}
