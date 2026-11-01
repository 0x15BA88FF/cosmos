{
  lib,
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation {
  pname = "opencode-v2";
  version = "2.0.6";

  src = fetchurl {
    url = "https://opencode.ai/files/bin/2.0.6/opencode-linux-x64.tar.gz";
    hash = "sha256-gzADIT4VUmbAc64/GeKmPQJ7nWaovJpGEOycnUs2nI0=";
  };

  sourceRoot = "source";

  unpackPhase = ''
    runHook preUnpack
    mkdir -p $sourceRoot
    tar -xzf $src -C $sourceRoot
    runHook postUnpack
  '';

  dontStrip = true;
  dontPatchELF = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -m755 opencode $out/bin/opencode
    patchelf --set-interpreter ${stdenv.cc.bintools.dynamicLinker} $out/bin/opencode

    runHook postInstall
  '';

  meta = {
    description = "OpenCode AI coding agent (v2 CLI)";
    homepage = "https://opencode.ai";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "opencode";
  };
}
