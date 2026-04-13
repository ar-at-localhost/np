{
  plugins.auto-session.settings = {
    auto_create = true;
    auto_save = true;
    auto_restore = true;
    single_session_mode = true;
    close_filetypes_on_save = ["checkhealth" "neo-tree" "snacks_terminal"];
    root_dir.__raw = "_M.dirs.sessions";
    post_restore_cmds = ["Neotree show"];
  };

  plugins.auto-session.luaConfig.post = ''
    if _M.dirs and _M.dirs.sessions then
      require("auto-session").auto_save_session()
    end
  '';
}
