{
  imports = [
    ./dap.nix
    ./keys/default.nix
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
}
