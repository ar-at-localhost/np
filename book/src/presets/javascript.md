# JavaScript/TypeScript Preset

Adds support for JavaScript and TypeScript.

## What It Includes

- **LSP**: biome (linter/formatter), eslint, vtsls (TypeScript).
- **Formatters**: Configured for JS/TS files.
- **DAP**: Node.js debugging.
- **Tree-Sitter**: JavaScript, TSX, TypeScript grammars.
- **Packages**: nodejs.

## Usage

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.presets.javascript
];
```
