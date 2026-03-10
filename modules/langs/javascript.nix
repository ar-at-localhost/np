{pkgs, ...}: let
  web = {
    __unkeyed-1 = "biome";
    __unkeyed-2 = "prettierd";
    __unkeyed-3 = "prettier";
    stop_after_first = true;
  };
in {
  lsp = {
    servers = {
      biome = {
        enable = true;
        config.require_config_file = true;
      };

      eslint.enable = true;
      vtsls.enable = true;
    };
  };

  plugins = {
    conform-nvim.settings.formatters_by_ft = {
      javascript = web;
      javascriptreact = web;
      typescript = web;
      typescriptreact = web;
    };

    dap = {
      adapters = {
        servers.pwa-node = {
          host = "localhost";
          port = "\${port}";

          executable = {
            command = "${pkgs.vscode-js-debug}/bin/js-debug";

            args = [
              "\${port}"
            ];
          };
        };
      };

      configurations = {
        javascript = [
          {
            type = "pwa-node";
            request = "launch";
            name = "Launch file";
            program = "\${file}";
            cwd = "\${workspaceFolder}";
            port = 9229;
          }
        ];
      };
    };

    treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      javascript
      tsx
      typescript
    ];
  };
}
