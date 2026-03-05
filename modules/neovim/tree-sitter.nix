{pkgs, ...}: {
  dependencies.tree-sitter.enable = true;

  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    folding.enable = true;
    indent.enable = true;
    nixvimInjections = true;

    settings = {
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

  plugins.treesitter-textobjects.enable = true;

  extraConfigLuaPre = ''
    local foo = 'bar';
  '';

  extraConfigLua = ''
    require("nvim-treesitter-textobjects").setup {
      move = {
        set_jumps = true,
      }
    }
  '';
}
