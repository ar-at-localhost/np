# Python Preset

Adds support for Python development.

## What It Includes

- **LSP**: basedpyright for type checking and intelligence.
- **Formatters**: ruff (linter/fixer) and black (formatter).
- **Tree-Sitter**: Python grammar.

## Usage

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.presets.python
];
```

## Notes

Requires Python and the tools in your PATH or Nix environment.
