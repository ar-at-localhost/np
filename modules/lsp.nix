_: {
  lsp = {
    inlayHints.enable = true;
    servers = {
      lua_ls.enable = true;
      jsonls.enable = true;
      marksman.enable = true;
      nil_ls.enable = true;
      taplo.enable = true;
      yamlls.enable = true;
    };
  };

  diagnostic.settings = {
    underline = true;
    update_in_insert = false;
    severity_sort = true;

    virtual_text = {
      spacing = 4;
      source = "if_many";
      prefix = " ●";
    };

    signs = {
      text = {
        "__rawKey__vim.diagnostic.severity.ERROR" = " ";
        "__rawKey__vim.diagnostic.severity.WARN" = " ";
        "__rawKey__vim.diagnostic.severity.HINT" = " ";
        "__rawKey__vim.diagnostic.severity.INFO" = " ";
      };

      texthl = {
        "__rawKey__vim.diagnostic.severity.ERROR" = "DiagnosticError";
        "__rawKey__vim.diagnostic.severity.WARN" = "DiagnosticWarn";
        "__rawKey__vim.diagnostic.severity.HINT" = "DiagnosticHint";
        "__rawKey__vim.diagnostic.severity.INFO" = "DiagnosticInfo";
      };
    };
  };
}
