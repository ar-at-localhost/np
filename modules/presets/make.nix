{pkgs, ...}: {
  plugins.tree-sitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    make
  ];
}
