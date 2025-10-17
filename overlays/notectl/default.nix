{ python3Packages, ... }:
python3Packages.buildPythonApplication {
  pname = "notectl";
  version = "1.0.0";

  src = ./.;
  format = "other";

  installPhase = ''
    mkdir -p $out/bin
    cp ./notectl.py $out/bin/notectl
    chmod +x $out/bin/notectl
  '';
}
