{pkgs, ...}: {
  dependencies.tree-sitter.enable = true;

  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    folding.enable = true;
    indent.enable = true;
    nixvimInjections = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      markdown
      nix
      regex
      toml
      vim
      vimdoc
      yaml
    ];
  };
}
