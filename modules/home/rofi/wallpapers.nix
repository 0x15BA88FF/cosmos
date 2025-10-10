{ nix-styles, ... }:
let
  fonts = nix-styles.fonts;
  rounded = nix-styles.rounded;
  fontSizes = nix-styles.fontSizes;
  palette = nix-styles.colors.palette;
in
''
  configuration {
      modi:                        [ drun ];
      show-icons:                  true;
      font:                        "${fonts.monospace.name} 10";
  }

  window {
      enabled:                     true;
      width:                       99%;
      height:                      340px;
      background-color:            ${
        nix-styles.colorToHexString palette.base00
      };
  }

  mainbox {
      enabled:                     true;
      spacing:                     10px;
      background-color:            transparent;
      children:                    [ inputbar, listbox ];
  }

  inputbar {
      enabled:                     true;
      padding:                     8px 8px 0px 8px;
      background-color:            ${
        nix-styles.colorToHexString palette.base00
      };
      children:                    [ entry ];
  }

  entry {
      enabled:                     true;
      padding:                     15px;
      border-radius:               ${toString rounded.md}px;
      text-color:                  ${
        nix-styles.colorToHexString palette.base00
      };
      background-color:            ${
        nix-styles.colorToHexString palette.base0D
      };
  }

  listbox {
      padding:                     0px 8px 8px 8px;
      background-color:            ${
        nix-styles.colorToHexString palette.base00
      };
      children:                    [ listview ];
  }

  listview {
      enabled:                     true;
      layout:                      horizontal;
      text-color:                  ${
        nix-styles.colorToHexString palette.base05
      };
      background-color:            transparent;
  }

  element {
      enabled:                     true;
      padding:                     12px;
      border-radius:               ${toString rounded.md}px;
      orientation:                 vertical;
      cursor:                      pointer;
      text-color:                  ${
        nix-styles.colorToHexString palette.base05
      };
      background-color:            transparent;
  }

  element selected.normal {
      background-color:            ${
        nix-styles.colorToHexString palette.base02
      };
  }

  element-text {
      cursor:                      inherit;
      text-color:                  inherit;
      background-color:            transparent;
  }
''
