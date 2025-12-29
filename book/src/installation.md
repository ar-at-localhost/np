# Installation

## Prerequisites

- Nix with flakes enabled.
- `nixpkgs-unstable`: `np` is developed against `nixpkgs-unstable` and requires
  packages from it.
- Basic knowledge of Nix and NixVim.

## Quick Setup

1. Clone or add `np` as a flake input in your project.

2. Create `nix/nixvim.nix` in your project:

```nix
{ np, ... }:

{
  imports = [
    np.nixvimModules.base
    np.nixvimModules.presets.javascript
    # Add more presets as needed
  ];

  # Your overrides
}
```

1. In `flake.nix`, build Neovim:

   > [!IMPORTANT]
   > `np` is built on `nixpkgs-unstable` and requires its consumer to provide
   > packages from it. Using a stable version of `nixpkgs` will result in errors.

   ```nix
   {
     inputs = {
       # np requires nixpkgs-unstable.
       nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
       nixvim.url = "github:nix-community/nixvim";
       np.url = "github:ar-at-localhost/np";
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
             extraSpecialArgs = { inherit np; };
           })
         ];
       };
     };
   }
   ```

1. Enter the shell: `nix develop`

For a quick preview of `np`: `nix run .#np`
