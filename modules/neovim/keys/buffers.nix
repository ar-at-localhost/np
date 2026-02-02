[
  {
    mode = "n";
    key = "<S-h>";
    action = "<cmd>bprevious<CR>";
    options.desc = "Buffers: Switch to Left (Previous)";
  }
  {
    mode = "n";
    key = "<S-l>";
    action = "<cmd>bnext<CR>";
    options.desc = "Buffers: Switch to Right (Next)";
  }
  {
    mode = "n";
    key = "<leader>bb";
    action = "<C-^>";
    options.desc = "Buffers: Switch to Other";
  }
  {
    mode = "n";
    key = "<leader>bh";
    action = "<cmd>bprevious<CR>";
    options.desc = "Buffers: Switch to Left (Previous)";
  }
  {
    mode = "n";
    key = "<leader>bl";
    action = "<cmd>bnext<CR>";
    options.desc = "Buffers: Switch to Right (Next)";
  }
  {
    mode = "n";
    key = "<leader>bd";
    action = "<cmd>lua Snacks.bufdelete()<CR>";
    options.desc = "Buffers: Delete Current";
  }
  {
    mode = "n";
    key = "<leader>bo";
    action = "<cmd>BufferLineCloseOthers<CR>";
    options.desc = "Buffers: Delete Other";
  }
  {
    mode = "n";
    key = "<leader>bs";
    action = "<cmd>lua Snacks.picker.buffers()<CR>";
    options.desc = "Buffers: Search";
  }
  {
    mode = "n";
    key = "<leader>br";
    action.__raw = ''
      function()
        Snacks.rename.rename_file()
      end
    '';
    options.desc = "Buffers: Rename current buffer";
  }
  {
    mode = "n";
    key = "<leader>bp";
    action = "<cmd>BufferLineTogglePin";
    options.desc = "Buffers: Toggle Pin";
  }
]
