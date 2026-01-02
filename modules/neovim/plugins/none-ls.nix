_: {
  plugins.none-ls = {
    enableLspFormat = false;
    sources = {
      code_actions = {
        statix.enable = true;
      };
      diagnostics = {
        deadnix.enable = true;
        statix.enable = true;
        markdownlint_cli2.enable = true;
      };
      formatting.markdownlint.enable = true;
      formatting.nix_flake_fmt.enable = true;
    };
  };
}
