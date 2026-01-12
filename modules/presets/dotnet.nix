{pkgs, ...}: {
  lsp.servers.omnisharp.enable = true;

  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        cs = ["dotnet-format"];
        fsharp = ["fantomas"];
      };
    };
  };

  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    c_sharp
  ];
}
