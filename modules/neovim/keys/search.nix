[
  {
    mode = "n";
    key = "<leader>sf";
    action = "<cmd>lua Snacks.picker.files()<CR>";
    options.desc = "Search: Files";
  }
  {
    mode = "n";
    key = "<leader>sb";
    action = "<cmd>lua Snacks.picker.buffers()<CR>";
    options.desc = "Search: Buffers";
  }
  {
    mode = "n";
    key = "<leader>sg";
    action = "<cmd>lua Snacks.picker.grep()<CR>";
    options.desc = "Search: Grep";
  }
  {
    mode = "n";
    key = "<leader>sr";
    action = "<cmd>GrugFar<CR>";
    options.desc = "Search: & Replace";
  }
  {
    mode = [
      "n"
      "x"
      "o"
    ];
    key = "n";
    action = "nzz";
    options.desc = "Next Search Result";
  }
  {
    mode = [
      "n"
      "x"
      "o"
    ];
    key = "N";
    action = "Nzz";
    options.desc = "Prev Search Result";
  }
]
