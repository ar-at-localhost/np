_: let
  proselint-config = {
    enable = true;
    package = null;
    settings = {
      filetypes = ["markdown" "tex"];
    };
  };
in {
  plugins.none-ls = {
    enableLspFormat = false;
    sources = {
      code_actions = {
        statix.enable = true;
        proselint = proselint-config;
      };

      diagnostics = {
        deadnix.enable = true;
        statix.enable = true;
        markdownlint_cli2.enable = true;
        proselint = proselint-config;
      };

      formatting.markdownlint.enable = true;
      formatting.nix_flake_fmt.enable = true;
    };
  };
}
