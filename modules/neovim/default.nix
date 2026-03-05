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

  extraConfigLuaPre = ''
    local function get_root()
      local cwd = vim.fn.getcwd()
      -- Check for git root or flake.nix
      local git_root = vim.fs.root(cwd, ".git")
      local nix_root = vim.fs.root(cwd, "flake.nix")
      return git_root or nix_root
    end

    _M.root = get_root()
  '';
}
