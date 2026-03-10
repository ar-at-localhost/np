[
  {
    mode = "n";
    key = "<leader><tab><tab>";
    action = "<cmd>tabnew<CR>";
    options.desc = "Tab: New ";
  }
  {
    mode = "n";
    key = "<leader><tab>l";
    action = "<cmd>tabnext<CR>";
    options.desc = "Tab: Next ";
  }
  {
    mode = "n";
    key = "<leader><tab>h";
    action = "<cmd>tabprevious<CR>";
    options.desc = "Tab: Previous ";
  }
  {
    mode = "n";
    key = "<leader><tab>L";
    action = "<cmd>tablast<CR>";
    options.desc = "Tab: Last ";
  }
  {
    mode = "n";
    key = "<leader><tab>F";
    action = "<cmd>tabfirst<CR>";
    options.desc = "Tab: First ";
  }
  {
    mode = "n";
    key = "<leader><tab>c";
    action.__raw = ''
      function()
        if vim.fn.tabpagenr() == vim.fn.tabpagenr("$") then
          vim.cmd("tabfirst")
        else
          vim.cmd("tabnext")
        end
      end'';
    options. desc = "Tab: Cycle";
  }
  {
    mode = "n";
    key = "<leader><tab>C";
    action = "<cmd>tabclose<CR>";
    options.desc = "Close Tab";
  }
  {
    mode = "n";
    key = "<leader><tab>o";
    action = "<cmd>tabonly<CR>";
    options.desc = "Close Other Tabs";
  }
]
