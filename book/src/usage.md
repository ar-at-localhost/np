# Usage

## Base Configuration

Import `inputs.np.nixvimModules.base` for the minimal setup supporting Nix, Lua,
JSON, Bash, YAML/TOML, and Markdown.

## Using Presets

Add presets for additional languages:

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.presets.python
  inputs.np.nixvimModules.presets.rust
];
```

## Running Neovim

- In your project's dev shell: `nvim`
- Preview base `np`: `nix run .#np`

## Examples

### Python Project

```nix
{ inputs, ... }:

{
  imports = [
    inputs.np.nixvimModules.base
    inputs.np.nixvimModules.presets.python
  ];

  # Add project-specific settings
  plugins.lsp.servers.nil_ls.enable = false;
}
```

### Full-Stack Web Project

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.presets.web  # Includes JS/TS, HTML, CSS, etc.
];
```
