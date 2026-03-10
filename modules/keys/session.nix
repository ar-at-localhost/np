[
  {
    mode = "n";
    key = "<leader>sl";
    action = "<cmd>lua require('persistence').load({ last = true })<CR>";
    options.desc = "Session: Load";
  }
  {
    mode = "n";
    key = "<leader>ss";
    action = "<cmd>lua require('persistence').select()<CR>";
    options.desc = "Session: Select";
  }
  {
    mode = "n";
    key = "<leader>sS";
    action = "<cmd>lua require('persistence').stop()<CR>";
    options.desc = "Session: Stop saving";
  }
]
