# Rust Preset

Adds Rust support.

## What It Includes

- **LSP**: rust-analyzer.
- **Tree-Sitter**: rust grammar.

## Usage

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.presets.rust
];
```
