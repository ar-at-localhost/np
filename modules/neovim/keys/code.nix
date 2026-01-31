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

  # --------------- Tree-sitter based Code Navigation --------------- #
  # --- Enable repeats --- #
  {
    mode = ["n" "x" "o"];
    key = ";";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next()<CR>
    '';
    options.desc = "TS: Next Function Start";
  }
  {
    mode = ["n" "x" "o"];
    key = ",";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous()<CR>
    '';
    options.desc = "TS: Next Function Start";
  }

  # --- Functions --- #
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgf";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Function Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgF";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Function Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGf";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Function End";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGF";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Function End";
  }

  # --- Classes --- #
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgc";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Class Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgC";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Class Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGc";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Class End";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGC";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Class End";
  }

  # --- Loops --- #
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgl";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Loop Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgL";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Loop Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGl";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Loop End";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGL";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Loop End";
  }

  # --- Conditionals --- #
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgd";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Conditional Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgD";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Conditional Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGd";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Conditional End";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGD";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Conditional End";
  }

  # --- Scopes --- #
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgs";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_start("@scope.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Scope Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgS";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_start("@scope.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Scope Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGs";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_end("@scope.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Scope End";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGS";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_end("@scope.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Scope End";
  }

  # --- Blocks --- #
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgb";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Block Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cgB";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Block Start";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGb";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_next_end("@block.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Next Block End";
  }
  {
    mode = ["n" "x" "o"];
    key = "<leader>cGB";
    action = ''
      <cmd>lua require("nvim-treesitter-textobjects.move").goto_previous_end("@block.outer", "textobjects")<CR>
    '';
    options.desc = "TS: Previous Block End";
  }
  # --------------- --------------------------------- --------------- #
]
