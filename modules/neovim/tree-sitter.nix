{pkgs, ...}: {
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
}
