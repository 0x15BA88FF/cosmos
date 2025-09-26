{ style, styleLib, ... }: {
  xdg.configFile = {
    "rofi/controls.rasi".text =
      import ./controls.nix { inherit style styleLib; };
    "rofi/clipboard.rasi".text =
      import ./clipboard.nix { inherit style styleLib; };
    "rofi/wallpapers".text =
      import ./wallpapers.nix { inherit style styleLib; };
    "rofi/emoji".text = import ./emoji.nix { inherit style styleLib; };
    "rofi/config.rasi".text = import ./config.nix { inherit style styleLib; };
  };
}
