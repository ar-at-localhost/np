# Docker Preset

Adds Docker support.

## What It Includes

- **LSP**: dockerls, docker_compose_ls.
- **Tree-Sitter**: dockerfile.

## Usage

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.presets.docker
];
```
