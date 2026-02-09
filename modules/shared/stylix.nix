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
      image = ../../assets/the-consummation-of-empire.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
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
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
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
