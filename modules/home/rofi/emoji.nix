{ style, styleLib, ... }:
let
  fonts = style.fonts;
  rounded = style.rounded;
  fontSizes = style.fontSizes;
  palette = style.colors.palette;
in
''
  configuration {
      modi:                        [ drun ];
      show-icons:                  false;
      font:                        "${fonts.monospace.name} 10";
  }

  window {
      enabled:                     true;
      width:                       280px;
      height:                      405px;
      border-radius:               ${toString rounded.lg}px;
      background-color:            ${styleLib.colorToHexString palette.base00};
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
      background-color:            ${styleLib.colorToHexString palette.base00};
      children:                    [ entry ];
  }

  entry {
      enabled:                     true;
      padding:                     15px;
      border-radius:               ${toString rounded.md}px;
      text-color:                  ${styleLib.colorToHexString palette.base00};
      background-color:            ${styleLib.colorToHexString palette.base0D};
  }

  listbox {
      padding:                     0px 8px 8px 8px;
      background-color:            ${styleLib.colorToHexString palette.base00};
      children:                    [ listview ];
  }

  listview {
      enabled:                     true;
      columns:                     5;
      fixed-columns:               true;
      layout:                      vertical;
      flow:                        horizontal;
      text-color:                  ${styleLib.colorToHexString palette.base05};
      background-color:            transparent;
  }

  element {
      enabled:                     true;
      padding:                     12px;
      border-radius:               ${toString rounded.md}px;
      cursor:                      pointer;
      text-color:                  ${styleLib.colorToHexString palette.base05};
      background-color:            transparent;
  }

  element selected.normal {
      background-color:            ${styleLib.colorToHexString palette.base02};
  }

  element-text {
      cursor:                      inherit;
      text-color:                  inherit;
      background-color:            transparent;
      font:                        "${fonts.emoji.name} 14";
      vertical-align:              0.5;
      horizontal-align:            0.5;
  }
''
