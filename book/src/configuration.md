# Configuration

## Overriding Options

Since `np` uses standard NixVim, customize by overriding options:

```nix
{
  imports = [ inputs.np.nixvimModules.base ];

  # Disable a base LSP
  lsp.servers.nil_ls.enable = false;

  # Add a custom plugin
  plugins = {
    myPlugin = {
      enable = true;
      # Config
    };
  };

  # Change keymaps
  keymaps = [
    {
      key = "<leader>f";
      action = ":Telescope find_files<CR>";
    }
  ];
}
```

## Shrinking the Config

Remove unwanted parts by setting `enable = false` on modules.

## Extending

Add your own modules, presets (language support), or xtras (tools/features) on top.

## No Custom Options

Remember, `np` has no custom Nix options—only NixVim's.
