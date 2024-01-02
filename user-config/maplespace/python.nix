{ config, pkgs, ... }:
let
  python-packages = ps: with ps; [
    numpy
    matplotlib
    scipy
    #rocketpy
    pillow
    pandas
    #CoolProp
    pyyaml
    future
    jupyter
    ipython
    pynvim
    dbus-python
    pygobject3
    jedi-language-server
  ];
in {
  home.packages = [
    (pkgs.python3.withPackages python-packages)
  ];
}
