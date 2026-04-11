{
  imports = [
    ./dap.nix
    ./keys
    ./lsp.nix
    ./opts.nix
    ./plugins
    ./theme.nix
    ./tree-sitter.nix
  ];

  globals.mapleader = " ";

  clipboard = {
    register = "unnamedplus";
  };

  extraConfigLuaPre = builtins.readFile ./lua/root.lua;
}
