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
    local function get_project_root()
      local cwd = vim.fn.getcwd()
      -- Check for git root or flake.nix
      local git_root = vim.fs.root(cwd, ".git")
      local nix_root = vim.fs.root(cwd, "flake.nix")
      return git_root or nix_root
    end

    local project_root = get_project_root()

    local org_agenda_files
    local org_default_notes_file

    if project_root then
      org_agenda_files = vim.fs.joinpath(project_root, ".nvim", "orgfiles/**/*")
      org_default_notes_file = vim.fs.joinpath(project_root, ".nvim", "orgfiles/notes.org")
    else
      org_agenda_files = "~/orgfiles/**/*"
      org_default_notes_file = "~/orgfiles/refile.org"
    end

    local Menu = require("org-modern.menu")
    require('orgmode').setup({
      org_agenda_files = org_agenda_files,
      org_default_notes_file = org_default_notes_file,

      ui = {
        menu = {
          handler = function(data)
    	Menu:new():open(data)
          end,
        },
      },
    })

    require("org-bullets").setup()
    require("headlines").setup()

    vim.lsp.enable('org')
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
