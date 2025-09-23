{ config, ... }: {
  console = {
    enable = true;
    earlySetup = true;

    colors = [
      config.style.colors.palette.base05
      config.style.colors.palette.base08
      config.style.colors.palette.base0B
      config.style.colors.palette.base0A
      config.style.colors.palette.base0D
      config.style.colors.palette.base0E
      config.style.colors.palette.base0C
      config.style.colors.palette.base00

      config.style.colors.palette.base03
      config.style.colors.palette.base08
      config.style.colors.palette.base0B
      config.style.colors.palette.base0A
      config.style.colors.palette.base0D
      config.style.colors.palette.base0E
      config.style.colors.palette.base0C
      config.style.colors.palette.base07
    ];

    font = "Lat2-Terminus16";
  };
}
