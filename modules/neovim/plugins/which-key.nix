{
  plugins.which-key = {
    enable = true;

    settings = {
      preset = "helix";
      spec = [
        [
          {
            __unkeyed-1 = "<leader>b";
            group = "Buffers";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = "Code / LSP";
          }
          {
            __unkeyed-1 = "<leader>cg";
            group = "TS Object Nav (Start)";
          }
          {
            __unkeyed-1 = "<leader>cG";
            group = "TS Object Nav (End)";
          }
          {
            __unkeyed-1 = "<leader>d";
            group = "Debugger";
          }
          {
            __unkeyed-1 = "<leader>e";
            group = "Explorer";
          }
          {
            __unkeyed-1 = "<leader>f";
            group = "Files";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = "Git";
          }
          {
            __unkeyed-1 = "<leader>n";
            group = "Notifications";
          }
          {
            __unkeyed-1 = "<leader>s";
            group = "Search";
          }
          {
            __unkeyed-1 = "<leader>w";
            group = "Windows";
          }
          {
            __unkeyed-1 = "<leader><tab>";
            group = "Tabs";
          }
        ]
      ];
    };
  };
}
