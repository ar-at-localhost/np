[
  {
    mode = "n";
    key = "<leader>fn";
    action = ":ene<CR>";
    options.desc = "File: New";
  }
  {
    mode = "n";
    key = "<leader>fs";
    action = "<esc>:w<CR>";
    options.desc = "File: Save";
  }
  {
    mode = "n";
    key = "<leader>fS";
    action = "<cmd>lua Snacks.scratch()<CR>";
    options.desc = "File: Scratch";
  }
  {
    mode = "n";
    key = "<leader>fc";
    action.__raw = ''
      function()
        vim.fn.setreg("+", vim.api.nvim_buf_get_lines(0, 0, -1, false), "l")
      end
    '';
    options.desc = "File: copy to clipboard";
  }
  {
    mode = [
      "i"
      "x"
      "n"
      "s"
    ];
    key = "<C-s>";
    action = "<esc>:w<CR>";
    options.desc = "Save File";
  }
]
