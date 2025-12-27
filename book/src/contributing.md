# Contributing

## Development Setup

1. Clone the repo.
2. Enter the dev shell: `nix develop`
3. Make changes.
4. Run tests: `nix flake check`
5. Lint: `nix run nixpkgs#alejandra -- --check .`

## Adding Presets

1. Create `modules/presets/yourlang.nix`.
2. Add LSP, formatters, tree-sitter as needed.
3. Update docs in `book/src/presets/`.
4. Test by importing in a sample config.

## CI

Changes are tested via GitHub Actions. Ensure `nix build .` and `nix flake check`
pass.

## Guidelines

- Follow NixVim best practices.
- Keep presets minimal and focused.
- Update docs for any changes.
