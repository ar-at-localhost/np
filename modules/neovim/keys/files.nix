[
  {
    mode = "n";
    key = "<leader>fn";
    action = ":ene<CR>";
    options.desc = "New File";
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
