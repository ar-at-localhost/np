# C/C++ Preset

Adds support for C and C++ development.

## What It Includes

- **LSP**: clangd for code intelligence.
- **Tree-Sitter**: Grammars for C and C++.
- **Dependencies**: Imports the `make` preset for build system support.

## Usage

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.presets.cpp
];
```

## Notes

Ensure clangd is available in your environment.
