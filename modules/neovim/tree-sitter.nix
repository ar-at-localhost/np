{pkgs, ...}: {
  plugins.treesitter-textobjects.enable = true;

  plugins.treesitter = {
    folding.enable = true;
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

  extraConfigLua = ''
    require("nvim-treesitter-textobjects").setup {
      move = {
        set_jumps = true,
      }
    }
  '';
}
