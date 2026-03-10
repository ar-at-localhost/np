{pkgs, ...}: {
  plugins = {
    conform-nvim = {
      settings = {
        formatters_by_ft = {
          xml = {
            unkeyed-1 = "xmllint";
          };
        };
      };
    };

    none-ls.sources.formatting.xmllint.enable = true;
    treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      xml
    ];
  };
}
