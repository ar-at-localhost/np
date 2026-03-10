{
  system,
  pkgs,
  nixvim,
  ...
}:
nixvim.legacyPackages.${system}.makeNixvimWithModule {
  inherit pkgs;
  module = {
    imports = [
      ../modules
      ../modules/langs
      ../modules/xtras
    ];
  };
  extraSpecialArgs = {
    inherit (pkgs) stdenv;
  };
}
