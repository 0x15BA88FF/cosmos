{ style, styleLib, ... }:
let palette = style.colors.palette;
in
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "base16";
      update_ms = 1000;
      vim_keys = true;
    };
    themes.base16 = ''
      theme[main_bg]="${styleLib.colorToHexString palette.base00}"
      theme[main_fg]="${styleLib.colorToHexString palette.base05}"
      theme[title]="${styleLib.colorToHexString palette.base05}"

      theme[hi_fg]="${styleLib.colorToHexString palette.base0B}"
      theme[inactive_fg]="${styleLib.colorToHexString palette.base01}"

      theme[selected_bg]="${styleLib.colorToHexString palette.base02}"
      theme[selected_fg]="${styleLib.colorToHexString palette.base0E}"

      theme[graph_text]="${styleLib.colorToHexString palette.base05}"
      theme[meter_bg]="${styleLib.colorToHexString palette.base02}"
      theme[proc_misc]="${styleLib.colorToHexString palette.base05}"

      theme[cpu_box]="${styleLib.colorToHexString palette.base0B}"
      theme[mem_box]="${styleLib.colorToHexString palette.base0C}"
      theme[net_box]="${styleLib.colorToHexString palette.base0E}"
      theme[proc_box]="${styleLib.colorToHexString palette.base08}"

      theme[div_line]="${styleLib.colorToHexString palette.base02}"

      theme[temp_start]="${styleLib.colorToHexString palette.base0B}"
      theme[temp_mid]="${styleLib.colorToHexString palette.base0A}"
      theme[temp_end]="${styleLib.colorToHexString palette.base08}"

      theme[cpu_start]="${styleLib.colorToHexString palette.base0B}"
      theme[cpu_mid]="${styleLib.colorToHexString palette.base0A}"
      theme[cpu_end]="${styleLib.colorToHexString palette.base08}"

      theme[free_start]="${styleLib.colorToHexString palette.base0E}"
      theme[free_mid]="${styleLib.colorToHexString palette.base0C}"
      theme[free_end]="${styleLib.colorToHexString palette.base0D}"

      theme[cached_start]="${styleLib.colorToHexString palette.base01}"
      theme[cached_mid]="${styleLib.colorToHexString palette.base0D}"
      theme[cached_end]="${styleLib.colorToHexString palette.base0C}"

      theme[available_start]="${styleLib.colorToHexString palette.base0A}"
      theme[available_mid]="${styleLib.colorToHexString palette.base0B}"
      theme[available_end]="${styleLib.colorToHexString palette.base08}"

      theme[used_start]="${styleLib.colorToHexString palette.base01}"
      theme[used_mid]="${styleLib.colorToHexString palette.base0B}"
      theme[used_end]="${styleLib.colorToHexString palette.base0C}"

      theme[download_start]="${styleLib.colorToHexString palette.base0A}"
      theme[download_mid]="${styleLib.colorToHexString palette.base0B}"
      theme[download_end]="${styleLib.colorToHexString palette.base08}"

      theme[upload_start]="${styleLib.colorToHexString palette.base01}"
      theme[upload_mid]="${styleLib.colorToHexString palette.base0B}"
      theme[upload_end]="${styleLib.colorToHexString palette.base0C}"

      theme[process_start]="${styleLib.colorToHexString palette.base0B}"
      theme[process_mid]="${styleLib.colorToHexString palette.base0B}"
      theme[process_end]="${styleLib.colorToHexString palette.base0A}"
    '';
  };
}
