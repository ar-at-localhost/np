[
  {
    mode = [
      "n"
      "i"
      "v"
    ];
    key = "<A-j>";
    action = ":m .+1<CR>==";
    options.desc = "Move Down";
  }
  {
    mode = [
      "n"
      "i"
      "v"
    ];
    key = "<A-k>";
    action = ":m .-2<CR>==";
    options.desc = "Move Up";
  }
  {
    mode = [
      "n"
      "i"
      "t"
    ];
    key = "<C-/>";
    action = "<cmd>lua Snacks.terminal()<CR>";
    options.desc = "Terminal: Toggle ";
  }
]
