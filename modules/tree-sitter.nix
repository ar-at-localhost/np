{pkgs, ...}: {
  dependencies.tree-sitter.enable = true;
  plugins.treesitter-textobjects.enable = true;

  plugins.treesitter = {
    nixvimInjections = true;

    settings = {
      enable = true;
      highlight.enable = true;
      folding.enable = true;
      indent.enable = true;
    };

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

  extraConfigLua = ''
    require("nvim-treesitter-textobjects").setup({
      move = {
        set_jumps = true,
      },
    })
  '';
}
