{
  description = "NixVim Pod | Neovim Pod | Neovim Project Oriented Development | No problem";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    alejandra.url = "github:kamadorueda/alejandra";
    proselint.url = "github:amperser/proselint";
  };

  outputs = {
    self,
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

    packages = forEachSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        np = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = {
            imports = [
              ./modules/neovim
              ./nix/nixvim.nix
            ];
          };
          extraSpecialArgs = {
            inherit (pkgs) stdenv;
          };
        };
        np-full = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = {
            imports = [
              ./modules/neovim
              ./nix/nixvim.nix
              ./modules/presets/cpp.nix
              ./modules/presets/docker.nix
              ./modules/presets/dotnet.nix
              ./modules/presets/javascript.nix
              ./modules/presets/make.nix
              ./modules/presets/python.nix
              ./modules/presets/rust.nix
              ./modules/presets/sql.nix
              ./modules/presets/web.nix
              ./modules/presets/xml.nix
            ];
          };
          extraSpecialArgs = {
            inherit (pkgs) stdenv;
          };
        };
        default = self.packages.${system}.np;
      }
    );

    apps = forEachSystem (system: {
      np = {
        type = "app";
        program = "${self.packages.${system}.np}/bin/nvim";
        meta = {
          description = "Neovim with np configuration";
        };
      };
      npf = {
        type = "app";
        program = "${self.packages.${system}.np-full}/bin/nvim";
        meta = {
          description = "Neovim with np configuration and all presets";
        };
      };
    });

    nixvimModules = {
      base = ./modules/neovim;
      presets = {
        cpp = ./modules/presets/cpp.nix;
        docker = ./modules/presets/docker.nix;
        javascript = ./modules/presets/javascript.nix;
        make = ./modules/presets/make.nix;
        python = ./modules/presets/python.nix;
        rust = ./modules/presets/rust.nix;
        sql = ./modules/presets/sql.nix;
        web = ./modules/presets/web.nix;
        xml = ./modules/presets/xml.nix;
      };
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
            proselintLatest
            (nixvim.legacyPackages.${system}.makeNixvimWithModule {
              inherit pkgs;
              module = {
                imports = [
                  ./modules/neovim
                  ./nix/nixvim.nix
                ];
              };
              extraSpecialArgs = {
                inherit (pkgs) stdenv;
              };
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
