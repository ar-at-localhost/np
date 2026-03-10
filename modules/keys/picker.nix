[
  {
    mode = [
      "n"
    ];
    key = "<leader>pr";
    action = "<cmd>lua Snacks.picker.resume()<CR>";
    options.desc = "Picker: Resume";
  }
  {
    mode = [
      "n"
    ];
    key = "<leader>pc";
    action = "<cmd>lua Snacks.picker.command_history()<CR>";
    options.desc = "Picker: Commands History";
  }
  {
    mode = "n";
    key = "<leader>pp";
    action.__raw = ''
      function()
        Snacks.picker.recent()
      end
    '';
    options.desc = "Picker: Recent files";
  }
]
