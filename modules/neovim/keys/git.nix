[
  {
    mode = "n";
    key = "<leader>gc";
    action = "<cmd>lua Snacks.picker.git_branches()<CR>";
    options.desc = "Git: Checkout (Branches)";
  }
  {
    mode = "n";
    key = "<leader>gu";
    action = "<cmd>Neogit<CR>";
    options.desc = "Git: UI (Neogit)";
  }
  {
    mode = "n";
    key = "<leader>gU";
    action = "<cmd>lua Snacks.lazygit.open()<CR>";
    options.desc = "Git: UI (Lazygit)";
  }
  {
    mode = "n";
    key = "<leader>gl";
    action = "<cmd>lua Snacks.picker.git_log()<CR>";
    options.desc = "Git: Log";
  }
  {
    mode = "n";
    key = "<leader>gd";
    action = "<cmd>lua Snacks.picker.git_diff()<CR>";
    options.desc = "Git: Diff (Picker)";
  }
  {
    mode = "n";
    key = "<leader>gD";
    action.__raw = ''
      function()
         if vim.t.diffview_view_initialized then
           vim.cmd("DiffviewClose")
         else
           vim.cmd("DiffviewOpen")
         end
      end
    '';
    options.desc = "Git: Diff (Toggle Diffview)";
  }
  {
    mode = "n";
    key = "<leader>gb";
    action = "<cmd>Gitsigns blame_line<CR>";
    options.desc = "Git: Blame Line";
  }
  {
    mode = "n";
    key = "<leader>gB";
    action = "<cmd>Gitsigns blame<CR>";
    options.desc = "Git: Blame Buffer";
  }
  {
    mode = "n";
    key = "<leader>gj";
    action = "<cmd>Gitsigns next_hunk<CR>";
    options.desc = "Git: Hunk Next";
  }
  {
    mode = "n";
    key = "<leader>gk";
    action = "<cmd>Gitsigns prev_hunk<CR>";
    options.desc = "Git: Hunk Previous";
  }
  {
    mode = "n";
    key = "<leader>ghs";
    action = "<cmd>Gitsigns stage_hunk<CR>";
    options.desc = "Git: Hunk Stage";
  }
  {
    mode = "n";
    key = "<leader>ghr";
    action = "<cmd>Gitsigns reset_hunk<CR>";
    options.desc = "Git: Hunk Reset";
  }
  {
    mode = "n";
    key = "<leader>gp";
    action = "<cmd>Gitsigns preview_hunk_inline<CR>";
    options.desc = "Git: Hunk Preview";
  }
  {
    mode = "n";
    key = "<leader>g+";
    action = "<cmd>Gitsigns stage_buffer<CR>";
    options.desc = "Git: Stage Buffer";
  }
  {
    mode = "n";
    key = "<leader>g-";
    action = "<cmd>Gitsigns reset_buffer<CR>";
    options.desc = "Git: Reset Buffer";
  }
  {
    mode = "n";
    key = "<leader>gS";
    action = "<cmd>lua Snacks.picker.git_status()<CR>";
    options.desc = "Git: Status";
  }
]
