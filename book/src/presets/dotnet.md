# .NET Preset

Adds support for .NET development.

## What It Includes

- **LSP**: omnisharp for C# IntelliSense and navigation.
- **Formatters**: dotnet-format for C#, fantomas for F#.
- **Tree-Sitter**: C# grammar.

## Usage

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.presets.dotnet
];
```

## Notes

Requires .NET SDK and the tools in your PATH or Nix environment.
