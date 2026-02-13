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
      (import ../modules/langs/exports.nix).all
      (import ../modules/xtras/exports.nix).all
    ];
  };
  extraSpecialArgs = {
    inherit (pkgs) stdenv;
  };
}
