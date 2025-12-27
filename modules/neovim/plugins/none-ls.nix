{...}: {
  plugins.none-ls = {
    enableLspFormat = false;
    sources = {
      diagnostics.markdownlint.enable = true;
    };
  };
}
