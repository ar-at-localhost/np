[
  {
    mode = "n";
    key = "<leader>cr";
    action = "<cmd>lua vim.lsp.buf.rename()<CR>";
    options = {
      desc = "LSP: Rename";
    };
  }
  {
    mode = "n";
    key = "<leader>ca";
    action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
    options = {
      desc = "LSP: Actions";
    };
  }
  {
    mode = "n";
    key = "<leader>cd";
    action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
    options = {
      desc = "LSP: Definitions";
    };
  }
  {
    mode = "n";
    key = "<leader>cD";
    action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>";
    options = {
      desc = "LSP: Declarations";
    };
  }
  {
    mode = "n";
    key = "<leader>ct";
    action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
    options = {
      desc = "LSP: Type Definitions";
    };
  }
  {
    mode = "n";
    key = "<leader>cT";
    action = "<cmd>Trouble diagnostics<CR>";
    options = {
      desc = "LSP: Diagnostics (Trouble)";
    };
  }
  {
    mode = "n";
    key = "<leader>cR";
    action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
    options = {
      desc = "LSP: References";
    };
  }
  {
    mode = "n";
    key = "<leader>ci";
    action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>";
    options = {
      desc = "LSP: Implementations";
    };
  }
  {
    mode = "n";
    key = "<leader>cs";
    action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
    options = {
      desc = "LSP: Symbols";
    };
  }
  {
    mode = "n";
    key = "<leader>cS";
    action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
    options = {
      desc = "LSP: Symbols (Workspace)";
    };
  }
  {
    mode = "n";
    key = "<leader>ce";
    action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
    options = {
      desc = "LSP: Diagnostics (Document)";
    };
  }
  {
    mode = "n";
    key = "<leader>cE";
    action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
    options = {
      desc = "LSP: Diagnostics (Workspace)";
    };
  }
  {
    mode = "n";
    key = "<leader>c[";
    action = ":lua vim.diagnostic.goto_next()<CR>";
    options.desc = "LSP: Next Diagnostic";
  }
  {
    mode = "n";
    key = "<leader>c]";
    action = ":lua vim.diagnostic.goto_prev()<CR>";
    options.desc = "LSP: Previous Diagnostic";
  }
  {
    mode = "n";
    key = "<leader>c{";
    action = ":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>";
    options.desc = "LSP: Next Error";
  }
  {
    mode = "n";
    key = "<leader>c}";
    action = ":lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>";
    options.desc = "LSP: Previous Error";
  }
  {
    mode = "n";
    key = "<leader>c(";
    action = ":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>";
    options.desc = "LSP: Next Warning";
  }
  {
    mode = "n";
    key = "<leader>c)";
    action = ":lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>";
    options.desc = "LSP: Previous Warning";
  }
  {
    mode = "n";
    key = "<leader>ccj";
    action = "o<Esc>gcc";
    options.desc = "Code: Add Comment Below";
  }
  {
    mode = "n";
    key = "<leader>cck";
    action = "O<Esc>gcc";
    options.desc = "Code: Add Comment Above";
  }
  {
    mode = "n";
    key = "<leader>cI";
    action = "<cmd>lua Snacks.picker.lsp_config()<CR>";
    options.desc = "Code: LSP Info";
  }
  {
    mode = "n";
    key = "<leader>co";
    action.__raw = ''
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports" },
            diagnostics = {},
          },
        })
      end
    '';
    options.desc = "Code: Organize Imports";
  }
  {
    mode = "n";
    key = "<leader>cu";
    action.__raw = ''
      function()
        vim.lsp.buf.code_action({
          apply = true,

          context = {
            only = {
              "source.removeUnusedImports"
            },
            diagnostics = {},
          },
        })
      end
    '';
    options.desc = "Code: Remove unused imports";
  }
  {
    mode = "n";
    key = "<leader>cU";
    action.__raw = ''
      function()
        vim.lsp.buf.code_action({
          apply = true,

          context = {
            only = {
              "source.removeUnused"
            },
            diagnostics = {},
          },
        })
      end
    '';
    options.desc = "Code: Remove unused";
  }
  {
    mode = ["n" "v"];
    key = "<leader>cf";
    action = "<cmd>lua require('conform').format({ async = true }) <CR>";
    options.desc = "Code: Format";
  }
]
