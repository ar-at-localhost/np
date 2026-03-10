{pkgs, ...}: {
  # TODO: Contribute to `plugins.orgmode` instead
  extraPlugins =
    [pkgs.vimPlugins.orgmode]
    ++ [
      (pkgs.vimUtils.buildVimPlugin {
        name = "org-bullets";
        src = pkgs.fetchFromGitHub {
          owner = "nvim-orgmode";
          repo = "org-bullets.nvim";
          rev = "main";
          hash = "sha256-/l8IfvVSPK7pt3Or39+uenryTM5aBvyJZX5trKNh0X0=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "org-modern";
        src = pkgs.fetchFromGitHub {
          owner = "danilshvalov";
          repo = "org-modern.nvim";
          rev = "main";
          hash = "sha256-TYs3g5CZDVXCFXuYaj3IriJ4qlIOxQgArVOzT7pqkqs=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "headlines";
        src = pkgs.fetchFromGitHub {
          owner = "lukas-reineke";
          repo = "headlines.nvim";
          rev = "master";
          hash = "sha256-LWYYVnLZgw6DhO/n0rclQVnon5TvyQVUGb2smaBzcPg=";
        };
      })
    ];

  extraConfigLua = ''
    local org = _M.dirs.org
    local config = {}

    if org then
      config.org_agenda_files = org .. "/**/*.org"
      config.org_default_notes_file = org .. "/notes.org"
    end

    local Menu = require("org-modern.menu")
    config.ui = {
      menu = {
        handler = function(data)
          Menu:new():open(data)
        end,
      },
    }

    require("orgmode").setup(config)
    require("org-bullets").setup()
    vim.lsp.enable("org")
  '';

  plugins.blink-cmp.settings = {
    sources = {
      per_filetype = {
        org = ["orgmode"];
      };

      providers = {
        orgmode = {
          name = "Orgmode";
          module = "orgmode.org.autocompletion.blink";
          fallbacks = ["buffer"];
        };
      };
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>o";
      group = "Orgmode";
      icon = "";
    }
  ];
}
