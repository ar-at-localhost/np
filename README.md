# np

`np` is a NixVim (Neovim) configuration focused on development specific
distribution of the Nvim. The goals is to create configs per project
for extra ease of development using Nvim -- without messing up the Nvim configurations.
The base of `np` is carefuly configured nvim that's easy to use regardless
of the languages you work with. I can't say it is like LazyVim, but I can
say it is inspired from it (while many design decisions violate LazyVim philosphy).

Thanks to Nvim, NixVim, Nix, LazyVim and many all plugin authors.

_This project is a movement towards my concept of POD. See
[POD](https://ar-at-localhost.github.io/np/pod.html)._

## Quick Preview

To try `np` without setting up a project, run the base configuration:

```bash
nix run .#np
```

This launches Neovim with the full `np`. [Screenshots](https://ar-at-localhost.github.io/np/default-experience.html#ui--theme).

## Usage

`np` provides a base NixVim configuration as a module. To configure a NixVim
project per project, follow this pattern:

- Create `nix/nixvim.nix` in your project for tailoring options:

```nix
{ np, ... }:

{
  imports = [ np.nixvimModules.base ];

  # Your project-specific NixVim module overrides
  plugins = {
    # Add or override plugins here
    lsp.servers.yourLanguage.enable = true;
  };

  # Other nixvim options to tailor for your project
}
```

- In your project's `flake.nix`, build and include the tailored Neovim as a dependency.

  > `np` is built on NixOS unstable pkgs and NixOS 25.11.
  > Use `main` / `nixos-25.11` branches accordingly.

  ```nix
  {
    inputs = {
      # np requires nixpkgs-unstable.
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixvim.url = "github:nix-community/nixvim";
      np.url = "github:ar-at-localhost/np"; # or local path
    };

    outputs = { self, nixpkgs, nixvim, np, ... }: let
      system = "x86_64-linux"; # adjust for your system
      # Use legacyPackages from nixpkgs-unstable.
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          # Other development packages...

          # Make nixvim with our unstable pkgs and the project-specific module.
          (nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = ./nix/nixvim.nix;
            extraSpecialArgs = { inherit (pkgs) stdenv; };
          })
        ];
      };
    };
  }
  ```

This pattern keeps your project configuration organized and allows Nix to merge
the base `np` module with your project-specific overrides, creating a tailored
Neovim instance per project.

### Using Presets & Xtras

`np` provides two categories of optional modules:

- **Langs**: Language-specific support (LSP, formatters, tree-sitter)
- **Xtras**: Tool and feature extensions

#### Individual Module Imports

```nix
{ np, ... }:

{
  imports = [
    np.nixvimModules.base
    np.nixvimModules.langs.python  # Python LSP, formatters, tree-sitter
    np.nixvimModules.langs.rust    # Rust LSP and tree-sitter
    np.nixvimModules.xtras.orgmode   # Orgmode support
  ];

  # Your project-specific overrides
  plugins.lsp.servers.nil_ls.enable = false;  # Example override
}
```

#### Bulk Imports

You can also import all presets or xtras at once:

```nix
{ np, ... }:

{
  imports = [
    np.nixvimModules.base
    np.nixvimModules.langs.all     # All language modules
    np.nixvimModules.xtras.all       # All xtras
  ];
}
```

#### Available Modules

**Langs** (language support):

- `cpp` (C/C++ with clangd), `docker` (Docker with dockerls), `dotnet` (.NET),
  `javascript` (JS/TS with biome/eslint), `make`, `mjml`, `python`, `rust`, `sql`,
  `web` (full web stack), `xml`

**Xtras** (tools/features):

- `orgmode` - Orgmode support with org-bullets, org-modern, and headlines

## FAQ

> Which language(s) support is configured out of the box?

**Answer**: Nix, Markdown, TOML/YAML, Bash, and Lua.

> Which languages are supported?

**Answer**: Many languages are supported via opt-in modules.
See [langs](./modules/langs/) for available options.

## Roadmap

See [Roadmap](./ROADMAP.md).
