[
  {
    mode = "n";
    key = "<leader>db";
    action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
    options.desc = "Debug: Breakpoint Toggle";
  }
  {
    mode = "n";
    key = "<leader>dB";
    action = "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>";
    options.desc = "Debug: Breakpoint Add (Conditional)";
  }
  {
    mode = "n";
    key = "<leader>dc";
    action = "<cmd>DapContinue<CR>";
    options.desc = "Debug: Breakpoint Add (Conditional)";
  }
  {
    mode = "n";
    key = "<leader>dC";
    action = "<cmd>DapClearBreakpoints<CR>";
    options.desc = "Debug: Clear Breakpoints";
  }
  {
    mode = "n";
    key = "<leader>dd";
    action = "<cmd>DapDisconnect<CR>";
    options.desc = "Debug: Disconnect";
  }
  {
    mode = "n";
    key = "<leader>ds";
    action = "<cmd>DapNew<CR>";
    options.desc = "Debug: Session";
  }
  {
    mode = "n";
    key = "<leader>dl";
    action = "<cmd>DapShowLogs<CR>";
    options.desc = "Debug: DAP Logs";
  }
  {
    mode = "n";
    key = "<leader>dq";
    action = "<cmd>lua require('dap').terminate()<CR>";
    options.desc = "Debug: Terminate";
  }
  {
    mode = "n";
    key = "<leader>du";
    action = "<cmd>DapViewToggle<CR>";
    options.desc = "Debug: UI (DAP View)";
  }
  {
    mode = "n";
    key = "<leader>dU";
    action = "<cmd>lua require('dapui').toggle()<CR>";
    options.desc = "Debug: UI (DAP UI)";
  }
  {
    mode = "n";
    key = "<leader>di";
    action = "<cmd>DapStepInto<CR>";
    options.desc = "Debug: Step Into";
  }
  {
    mode = "n";
    key = "<leader>do";
    action = "<cmd>DapStepOut<CR>";
    options.desc = "Debug: Step Out";
  }
  {
    mode = "n";
    key = "<leader>dO";
    action = "<cmd>DapStepOver<CR>";
    options.desc = "Debug: Step Over";
  }
  {
    key = "<leader>dp";
    mode = "n";
    options.desc = "DAP: Pick & run (Buffer)";

    action.__raw = ''
      function ()
        local dap = require("dap")

        local ft = vim.bo.filetype
        local configs = dap.configurations[ft] or {}

        if #configs == 0 then
          print("No DAP configurations for filetype: " .. ft)
          return
        end

        vim.ui.select(configs, {
          prompt = "Select DAP Configuration (" .. ft .. ")",
          format_item = function(item)
            return item.name
          end,
        }, function(choice)
          if choice then
            dap.run(choice)
          end
        end)
      end
    '';
  }
  {
    key = "<leader>dP";
    mode = "n";
    options.desc = "DAP: Pick & run (Workspace)";

    action.__raw = ''
      function ()
        local dap = require("dap")
        local all_configs = {}

        -- Gather all configurations from all filetypes
        for ft, configs in pairs(dap.configurations) do
          for _, config in ipairs(configs) do
            table.insert(all_configs, { name = config.name, config = config })
          end
        end

        if #all_configs == 0 then
          print("No DAP configurations available")
          return
        end

        -- Use vim.ui.select
        vim.ui.select(all_configs, {
          prompt = "Select DAP Configuration",
          format_item = function(item)
            return item.name
          end,
        }, function(choice)
          if choice then
            dap.run(choice.config)
          end
        end)
      end
    '';
  }
]
