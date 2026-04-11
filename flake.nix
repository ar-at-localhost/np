{
  description = "NixVim Pod | Neovim Pod | Neovim Project Oriented Development | No problem";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    alejandra.url = "github:kamadorueda/alejandra";
    proselint.url = "github:amperser/proselint";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    flake-utils,
    nixvim,
    proselint,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      overlay-unstable = _: _: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      pkgs = import nixpkgs {
        inherit system;
        overlays = [overlay-unstable];
        config.allowUnfree = true;
      };

      proselintLatest = proselint.packages.${system}.default;

      preview = import ./nix/preview.nix {
        inherit system pkgs nixvim;
        inherit (pkgs) lib stdenv;
      };

      customNixvim = import ./nix/nixvim.nix {
        inherit system pkgs nixvim;
        inherit (pkgs) lib stdenv;
      };
    in {
      formatter = pkgs.alejandra;

      apps = {
        np = {
          type = "app";
          program = "${preview}/bin/nvim";
        };
        np-print-init = {
          type = "app";
          program = "${preview}/bin/nixvim-print-init";
        };
      };

      devShells.default = pkgs.mkShell {
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
          customNixvim
        ];

        shellHook = ''
          if [ ! -f .git/hooks/pre-commit ]; then
            echo "Installing lefthook hooks..."
            ${pkgs.lefthook}/bin/lefthook install
          fi
        '';
      };
    })
    // {
      nixvimModules = {
        base = ./modules;
        langs = {
          all = ./modules/langs;
          cpp = ./modules/langs/cpp.nix;
          css = ./modules/langs/css.nix;
          docker = ./modules/langs/docker.nix;
          dotnet = ./modules/langs/dotnet.nix;
          javascript = ./modules/langs/javascript.nix;
          make = ./modules/langs/make.nix;
          mjml = ./modules/langs/mjml.nix;
          python = ./modules/langs/python.nix;
          rust = ./modules/langs/rust.nix;
          sql = ./modules/langs/sql.nix;
          web = ./modules/langs/web.nix;
          xml = ./modules/langs/xml.nix;
        };
        xtras = {
          all = ./modules/xtras;
          orgmode = ./modules/xtras/orgmode.nix;
        };
      };
    };
}
