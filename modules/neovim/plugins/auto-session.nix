{
  plugins.auto-session.settings = {
    root_dir.__raw = ''
      (function()
        -- detect project via .git or flake.nix
        local cwd = vim.loop.cwd()

        local found = vim.fs.find({ ".git", "flake.nix" }, {
          upward = true,
          path = cwd,
          stop = vim.loop.os_homedir(),
        })[1]

        if found and found ~= "" then
          -- storage: <project>/.nvim/sessions
          return vim.fs.dirname(found) .. "/.nvim/sessions"
        end

        -- fallback: stdpath("data")/sessions
        return vim.fn.stdpath("data") .. "/sessions"
      end)()
    '';
  };
}
