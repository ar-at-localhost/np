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
      ../modules/neovim
      ../modules/presets
      ../modules/xtras/orgmode.nix
    ];
  };
  extraSpecialArgs = {
    inherit (pkgs) stdenv;
  };
}
