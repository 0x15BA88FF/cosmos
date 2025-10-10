{ nix-styles, ... }:
let
  fonts = nix-styles.fonts;
  rounded = nix-styles.rounded;
  fontSizes = nix-styles.fontSizes;
  palette = nix-styles.colors.palette;
in
''
  configuration {
    modi: [ drun ];
    show-icons: false;
    font: "${fonts.monospace.name} ${toString fontSizes.base}";
  }

  window {
    enabled: true;
    width: 280px;
    height: 420px;
    border-radius: ${toString rounded.xl}px;
    background-color: ${nix-styles.colorToHexString palette.base00};
  }

  mainbox {
    enabled: true;
    spacing: 10px;
    background-color: transparent;
    children: [ inputbar, listbox ];
  }

  inputbar {
    enabled: true;
    children: [ entry ];
    padding: 8px 8px 0px 8px;
    background-color: ${nix-styles.colorToHexString palette.base00};
  }

  entry {
    enabled: true;
    padding: 15px;
    border-radius: ${toString rounded.lg}px;
    text-color: ${nix-styles.colorToHexString palette.base00};
    background-color: ${nix-styles.colorToHexString palette.base0D};
  }

  listbox {
    children: [ listview ];
    padding: 0px 8px 8px 8px;
    background-color: ${nix-styles.colorToHexString palette.base00};
  }

  listview {
    enabled: true;
    layout: vertical;
    text-color: ${nix-styles.colorToHexString palette.base05};
    background-color: transparent;
  }

  element {
    enabled: true;
    padding: 12px;
    cursor: pointer;
    border-radius: 10px;
    background-color: transparent;
    text-color: ${nix-styles.colorToHexString palette.base05};
  }

  element selected.normal {
    text-color: ${nix-styles.colorToHexString palette.base00};
    background-color: ${nix-styles.colorToHexString palette.base0B};
  }

  element-text {
    cursor: inherit;
    text-color: inherit;
    background-color: transparent;
  }
''
