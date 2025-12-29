# Usage

## Configuration

To configure `np`, create a `nix/nixvim.nix` file in your project. This file is
a NixVim module where you can import `np`'s base configuration, add language
presets, and apply your own overrides.

Here is an example for a Python project:

```nix
# nix/nixvim.nix
{ np, ... }:

{
  imports = [
    np.nixvimModules.base
    np.nixvimModules.presets.python
  ];

  # Add project-specific settings
  plugins.lsp.servers.nil_ls.enable = false;
}
```

Remember to pass the `np` flake input to the module in your project's `flake.nix`
using `extraSpecialArgs`. See the [Installation](./installation.md) guide for
the full `flake.nix` setup.

## Running Neovim

- In your project's dev shell: `nvim`
- Preview base `np`: `nix run .#np`

## Examples

### Full-Stack Web Project

```nix
# nix/nixvim.nix
{ np, ... }:

{
  imports = [
    np.nixvimModules.base
    np.nixvimModules.presets.web  # Includes JS/TS, HTML, CSS, etc.
  ];
}
```
