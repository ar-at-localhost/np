_: {
  keymaps =
    import ./buffers.nix
    ++ import ./code.nix
    ++ import ./debugger.nix
    ++ import ./explorer.nix
    ++ import ./files.nix
    ++ import ./git.nix
    ++ import ./misc.nix
    ++ import ./notification.nix
    ++ import ./picker.nix
    ++ import ./search.nix
    ++ import ./session.nix
    ++ import ./tabs.nix
    ++ import ./ui.nix
    ++ import ./windows.nix;

  # Bind the toggles
  # FIXME: Move the to corresponding group (module - imported above)
  # and export the bindings as attrset of `extraConfigLua` & `keymaps`
  # Or maybe just let them directly declare what the need
  extraConfigLua = ''
    Snacks.toggle.diagnostics():map('<leader>c.d')
    Snacks.toggle.treesitter():map('<leader>c.t')
    Snacks.toggle.indent():map('<leader>ui')
    Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>un')
  '';
}
