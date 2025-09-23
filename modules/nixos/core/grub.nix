{ lib, pkgs, config, ... }:

let
  font = pkgs.noto-fonts;
  mkGrubFont = pkgs.runCommand "grub-font.pf2"
    {
      buildInputs = [ pkgs.grub2 pkgs.fontconfig ];
    } ''
    font=$(${pkgs.fontconfig}/bin/fc-match "Noto Sans" --format=%{file})
    grub-mkfont --output $out $font --size 24
  '';

  mkGrubBackground = color:
    pkgs.runCommand "grub-bg" { buildInputs = [ pkgs.imagemagick ]; } ''
      convert -size 1x1 xc:${color} $out/bg.png
      cp $out $out/background.png
    '';
in
{
  options.systemModules.grub = {
    enable = lib.mkEnableOption "Enable grub configuration";
    style.enable = lib.mkEnableOption "Enable grub style";
  };

  config = lib.mkMerge [
    (lib.mkIf config.systemModules.grub.enable {
      boot.loader.grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        configurationLimit = 3;
        configurationName = "grub";
      };
    })
    (lib.mkIf
      (config.systemModules.grub.enable
        && config.systemModules.grub.style.enable)
      {
        boot.loader.grub = {
          font = mkGrubFont;
          backgroundColor = config.style.colors.palette.base00;
          splashImage = mkGrubBackground config.style.colors.palette.base00;
        };
      })
  ];
}
