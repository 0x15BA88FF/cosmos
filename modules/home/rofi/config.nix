{ nix-styles, ... }:
let
  palette = nix-styles.colors.palette;
  fontSizes = nix-styles.fontSizes;
  rounded = nix-styles.rounded;
  fonts = nix-styles.fonts;
in
''
  configuration {
      modi: [ drun ];
      show-icons: true;
      font: "${fonts.monospace.name} ${toString fontSizes.base}";
  }

  window {
      enabled: true;
      width: 400px;
      height: 520px;
      border-radius: ${toString rounded.xl}px;
      background-color: ${nix-styles.colorToHexString palette.base00};
  }

  mainbox {
      enabled: true;
      spacing: 8px;
      padding: 8px;
      background-color: transparent;
      children: [ inputbar, mode-switcher, listbox ];
  }

  inputbar {
      enabled: true;
      spacing: 10px;
      padding: 15px;
      children: [ textbox-prompt, entry ];
      border-radius: ${toString rounded.lg}px;
      text-color: ${nix-styles.colorToHexString palette.base00};
      background-color: ${nix-styles.colorToHexString palette.base0D};
  }

  textbox-prompt {
      str: " ";
      enabled: true;
      expand: false;
      text-color: inherit;
      background-color: inherit;
  }

  entry {
      enabled: true;
      cursor: text;
      text-color: inherit;
      placeholder: "Search";
      background-color: inherit;
      placeholder-color: inherit;
  }

  mode-switcher {
      enabled: true;
      spacing: 8px;
      padding: 5px;
      border-radius: ${toString rounded.lg}px;
      text-color: ${nix-styles.colorToHexString palette.base05};
      background-color: ${nix-styles.colorToHexString palette.base02};
  }

  listbox {
      enabled: true;
      spacing: 20px;
      background-color: transparent;
      children: [ message, listview ];
  }

  button {
      padding: 10px;
      cursor: pointer;
      text-color: inherit;
      border-radius: ${toString rounded.md}px;
      background-color: ${nix-styles.colorToHexString palette.base00};
  }

  button selected {
      text-color: ${nix-styles.colorToHexString palette.base00};
      background-color: ${nix-styles.colorToHexString palette.base0D};
  }

  listview {
      lines: 7;
      enabled: true;
      background-color: transparent;
      text-color: ${nix-styles.colorToHexString palette.base05};
  }

  element {
      enabled: true;
      spacing: 10px;
      padding: 10px;
      cursor: pointer;
      background-color: transparent;
      border-radius: ${toString rounded.lg}px;
      text-color: ${nix-styles.colorToHexString palette.base05};
  }

  element normal.normal {
      text-color: inherit;
      background-color: inherit;
  }

  element normal.urgent {
      text-color: ${nix-styles.colorToHexString palette.base05};
      background-color: ${nix-styles.colorToHexString palette.base08};
  }

  element normal.active {
      text-color: ${nix-styles.colorToHexString palette.base05};
      background-color: ${nix-styles.colorToHexString palette.base0B};
  }

  element selected.normal {
      text-color: ${nix-styles.colorToHexString palette.base05};
      background-color: ${nix-styles.colorToHexString palette.base0B};
  }

  element selected.urgent {
      background-color: ${nix-styles.colorToHexString palette.base08};
      text-color: ${nix-styles.colorToHexString palette.base05};
  }

  element selected.active {
      text-color: ${nix-styles.colorToHexString palette.base05};
      background-color: ${nix-styles.colorToHexString palette.base08};
  }

  element-icon {
      size: 42px;
      cursor: inherit;
      text-color: inherit;
      background-color: transparent;
  }

  element-text {
      cursor: inherit;
      vertical-align: 0.5;
      horizontal-align: 0.0;
      text-color: inherit;
      background-color: transparent;
  }

  message {
      background-color: ${nix-styles.colorToHexString palette.base02};
  }

  error-message {
      padding: 15px;
      border-radius: ${toString rounded.xl}px;
      text-color: ${nix-styles.colorToHexString palette.base05};
      background-color: ${nix-styles.colorToHexString palette.base00};
  }

  textbox {
      padding: 15px;
      vertical-align: 0.5;
      horizontal-align: 0.0;
      border-radius: ${toString rounded.md}px;
      text-color: ${nix-styles.colorToHexString palette.base05};
      background-color: ${nix-styles.colorToHexString palette.base02};
  }
''
