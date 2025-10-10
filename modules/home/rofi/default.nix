{ ... }: {
  xdg.configFile = {
    "rofi/emoji".text = import ./emoji.nix;
    "rofi/config.rasi".text = import ./config.nix;
    "rofi/wallpapers".text = import ./wallpapers.nix;
    "rofi/controls.rasi".text = import ./controls.nix;
    "rofi/clipboard.rasi".text = import ./clipboard.nix;
  };
}
