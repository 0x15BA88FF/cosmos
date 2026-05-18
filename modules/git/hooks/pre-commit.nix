{ pkgs }:
pkgs.writeShellApplication {
  name = "pre-commit";
  runtimeInputs = [ pkgs.gitleaks ];
  text = ''
    if ! gitleaks protect --no-banner --staged --verbose; then
      echo "Found potential secrets. Review or use 'git commit --no-verify'"
      exit 1
    fi
  '';
}
