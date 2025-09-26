{ pkgs, config, lib, styleLib, ... }:
let
  palette = config.style.colors.palette;
  backgroundColor = styleLib.colorToRgbString palette.base00;

  consmic-splashPlymouthTheme = pkgs.stdenv.mkDerivation {
    version = "1.0";
    pname = "consmic-splash-plymouth";
    src = pkgs.writeTextDir "dummy" "";
    buildPhase = ''
      mkdir -p theme
      cat > theme/consmic-splash.plymouth << EOF
        [Plymouth Theme]
        Name=consmic-splash plymouth
        Description=A minimal nixos plymouth theme
        ModuleName=script

        [script]
        ImageDir=$out/share/plymouth/themes/consmic-splash
        ScriptFile=$out/share/plymouth/themes/consmic-splash/consmic-splash.script
      EOF
      cat > theme/consmic-splash.script << 'EOF'
        Window.SetBackgroundTopColor(${backgroundColor});
        Window.SetBackgroundBottomColor(${backgroundColor});

        original_logo = Image("logo.png");
        logo.image = original_logo.Scale(
          original_logo.GetWidth() / 2, original_logo.GetHeight() / 2
        );

        logo.sprite = Sprite(logo.image);
        logo.sprite.SetX(Window.GetWidth() / 2 - logo.image.GetWidth() / 2);
        logo.sprite.SetY(Window.GetHeight() / 2 - logo.image.GetHeight() / 2);
      EOF
    '';
    installPhase = ''
      mkdir -p $out/share/plymouth/themes/consmic-splash
      cp theme/consmic-splash.plymouth $out/share/plymouth/themes/consmic-splash/
      cp theme/consmic-splash.script $out/share/plymouth/themes/consmic-splash/
      cp ${
        ./nixsplash/overlay.png
      } $out/share/plymouth/themes/consmic-splash/logo.png
    '';
    meta = with lib; {
      description = "A minimal plymouth theme";
      platforms = platforms.linux;
    };
  };
in
{
  boot.plymouth = {
    enable = true;
    theme = "consmic-splash";
    themePackages = [ consmic-splashPlymouthTheme ];
  };
  boot.initrd.systemd.enable = true;
  boot.kernelParams = [ "quiet" "splash" ];
}
