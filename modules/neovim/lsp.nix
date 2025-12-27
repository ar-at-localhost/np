{...}: {
  lsp.inlayHints.enable = true;
  lsp.servers.lua_ls.enable = true;
  lsp.servers.jsonls.enable = true;
  lsp.servers.marksman.enable = true;
  lsp.servers.nil_ls.enable = true;
  lsp.servers.taplo.enable = true;
  lsp.servers.yamlls.enable = true;

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
