{pkgs, ...}: {
  imports = [
    ./make.nix
  ];

  lsp.servers.clangd.enable = true;

  plugins.tree-sitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    c
    cpp
  ];
}
