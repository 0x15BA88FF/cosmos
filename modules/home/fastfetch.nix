{ ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      source = "nixos_small";
      display = {
        disableLinewrap = true;
        separator = " ";
      };
      modules = [
        {
          key = " ";
          type = "title";
        }
        {
          key = " ";
          type = "os";
          keyColor = "red";
          outputColor = "red";
        }
        {
          key = " ";
          type = "host";
          keyColor = "red";
          outputColor = "red";
        }
        {
          key = "󱗜 ";
          type = "kernel";
          keyColor = "red";
          outputColor = "red";
        }
        {
          key = " ";
          type = "wm";
          keyColor = "green";
          outputColor = "green";
        }
        {
          key = " ";
          type = "terminal";
          keyColor = "green";
          outputColor = "green";
        }
        {
          key = " ";
          type = "shell";
          keyColor = "green";
          outputColor = "green";
        }
        {
          key = "󰏓 ";
          type = "packages";
          keyColor = "blue";
          outputColor = "blue";
        }
        {
          key = " ";
          type = "uptime";
          keyColor = "blue";
          outputColor = "blue";
        }
        {
          key = " ";
          type = "cpu";
          keyColor = "cyan";
          outputColor = "cyan";
        }
        {
          key = " ";
          type = "gpu";
          keyColor = "cyan";
          outputColor = "cyan";
        }
        {
          key = " ";
          type = "memory";
          keyColor = "cyan";
          outputColor = "cyan";
        }
        {
          key = "󰋊 ";
          type = "disk";
          keyColor = "cyan";
          outputColor = "cyan";
        }
        { type = "break"; }
        { type = "colors"; }
      ];
    };
  };
}
