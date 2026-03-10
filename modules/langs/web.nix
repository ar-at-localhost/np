{pkgs, ...}: let
  web = {
    __unkeyed-1 = "biome";
    __unkeyed-2 = "prettierd";
    __unkeyed-3 = "prettier";
    stop_after_first = true;
  };
in {
  imports = [
    ./javascript.nix
    ./sql.nix
    ./xml.nix
    ./css.nix
  ];

  lsp = {
    servers = {
      html.enable = true;
    };
  };

  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        html = web;
      };
    };
  };

  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    html
    http
    sql
  ];
}
