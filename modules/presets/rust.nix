{pkgs, ...}: {
  lsp.servers.rust-analyzer.enable = true;

  plugins.tree-sitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    rust
  ];
}
