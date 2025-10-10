{ python3Packages, ... }:
python3Packages.buildPythonApplication {
  pname = "devctl";
  version = "1.0.0";

  src = ./.;
  format = "other";

  installPhase = ''
    mkdir -p $out/bin
    cp ./devctl.py $out/bin/devctl
    chmod +x $out/bin/devctl
  '';
}
