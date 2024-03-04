{ pkgs ? import <nixpkgs> {}}:
let
  fhs = pkgs.buildFHSUserEnv {
    name = "build-conda-env";
    targetPkgs = _: [
      pkgs.micromamba
    ];
    profile = ''
      set -e
      export ENV_NAME="rocketsimpy"
      export MAMBA_ROOT_PREFIX=${builtins.getEnv "PWD"}/.mamba
      eval "$(micromamba shell hook --shell=dash | sed 's/complete / # complete/g')"
      micromamba create --yes -q -n $ENV_NAME
      micromamba activate $ENV_NAME
      micromamba install --yes -f ~/python-env/environment.yml -c conda-forge
      pip install rocketcea
      fish
      set +e
    '';
  };
in fhs.env
