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
    ++ import ./windows.nix;
}
