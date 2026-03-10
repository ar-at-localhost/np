{pkgs, ...}: let
  lib = import ./lib.nix {};
  inherit (lib) web-formatters;
in {
  lsp.servers = {
    cssls.enable = true;
    tailwindcss.enable = true;
  };

  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        css = web-formatters;
      };
    };
  };

  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    css
  ];
}
