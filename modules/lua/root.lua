local function get_root()
  local cwd = vim.fn.getcwd()
  -- Check for git root or flake.nix
  local git_root = vim.fs.root(cwd, ".git")
  local nix_root = vim.fs.root(cwd, "flake.nix")
  return git_root or nix_root
end

_M = _M or {}
_M.dirs = {}
_M.dirs.root = get_root()

if _M.dirs.root then
  _M.dirs.nvim = _M.dirs.root .. "/.nvim"
  _M.dirs.org = _M.dirs.root .. "/orgfiles"
  local dirs = { "sessions", "scratchs" }

  for _, dir in ipairs(dirs) do
    local dir_path = string.format("%s/%s", _M.dirs.nvim, dir)
    vim.system({
      "mkdir",
      "-p",
      dir_path,
    })

    _M.dirs[dir] = dir_path
  end
end
