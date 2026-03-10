{
  system,
  lib,
  pkgs,
  stdenv,
  nixvim,
  ...
}: (nixvim.legacyPackages.${system}.makeNixvimWithModule {
  inherit pkgs;
  module = {
    imports = [
      ../modules
      ../modules/xtras
    ];

    clipboard = {
      providers = {
        wl-copy.enable = lib.strings.hasPrefix "linux" stdenv.hostPlatform.system;
      };
    };
  };
  extraSpecialArgs = {
    inherit (pkgs) stdenv;
  };
})
