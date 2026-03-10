{
  description = "NixVim Pod | Neovim Pod | Neovim Project Oriented Development | No problem";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra.url = "github:kamadorueda/alejandra";
    proselint.url = "github:amperser/proselint";
  };

  outputs = {
    nixpkgs,
    nixvim,
    proselint,
    ...
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forEachSystem = nixpkgs.lib.genAttrs systems;
  in {
    formatter = forEachSystem (system: nixpkgs.legacyPackages.${system}.alejandra);

    apps = forEachSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      preview = import ./nix/preview.nix {
        inherit system pkgs nixvim;
        inherit (pkgs) lib stdenv;
      };
    in {
      np = {
        type = "app";
        program = "${preview}/bin/nvim";
      };
      np-print-init = {
        type = "app";
        program = "${preview}/bin/nixvim-print-init";
      };
    });

    nixvimModules = {
      base = ./modules;
      langs = ./modules/langs/exports.nix;
      xtras = ./modules/xtras/exports.nix;
    };

    devShells = forEachSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        proselintLatest = proselint.packages.${system}.default;
      in {
        default = pkgs.mkShell {
          packages = [
            pkgs.statix
            pkgs.alejandra
            pkgs.lefthook
            pkgs.markdownlint-cli2
            pkgs.markdownlint-cli
            pkgs.mdbook
            pkgs.prettierd
            pkgs.stylua
            proselintLatest
            (import ./nix/nixvim.nix {
              inherit system pkgs nixvim;
              inherit (pkgs) lib stdenv;
            })
          ];

          shellHook = ''
            if [ ! -f .git/hooks/pre-commit ]; then
              echo "Installing lefthook hooks..."
              lefthook install
            fi
          '';
        };
      }
    );
  };
}
