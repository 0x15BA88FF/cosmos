{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.shared.stylix.enable = lib.mkEnableOption "Enable stylix";

  config = lib.mkIf config.modules.shared.stylix.enable {
    stylix = {
      enable = true;
      polarity = "dark";
      image = ../../assets/8004868.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
      fonts = {
        serif = {
          name = "Noto Serif";
          package = pkgs.noto-fonts;
        };
        sansSerif = {
          name = "Noto Sans";
          package = pkgs.noto-fonts;
        };
        monospace = {
          name = "JetBrainsMono Nerd Font";
          package = pkgs.nerd-fonts.jetbrains-mono;
        };
        sizes = {
          terminal = 11;
          applications = 10;
        };
      };
      cursor = {
        size = 24;
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };
    };
  };
}
