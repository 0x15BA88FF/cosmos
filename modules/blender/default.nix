{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.blender.enable = lib.mkEnableOption "Enable blender";

  config = lib.mkIf config.modules.home.blender.enable {
    home.packages = [
      (pkgs.blender.withPackages (
        ps: with ps; [
          websockets
          cryptography
          boto3
          (gql.overridePythonAttrs (old: rec {
            version = "3.5.3";

            src = pkgs.fetchFromGitHub {
              owner = "graphql-python";
              repo = "gql";
              tag = "v${version}";
              hash = "sha256-0mVMhJHlF6EZ3D9fuNrzkoHm9vIAKxbuajmUs1JL0HY=";
            };

            # gql 3.5.x declares upper bounds that may be older than what
            # nixpkgs ships; relax them so the runtime deps check passes
            pythonRelaxDeps = [
              "websockets"
              "graphql-core"
            ];

            doCheck = false;
            pythonImportsCheck = [ ];
          }))
        ]
      ))
    ];
  };
}
