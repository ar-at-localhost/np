# Orgmode

Provides Orgmode support with additional plugins for enhanced editing experience.

## Features

- **orgmode**: Core Orgmode functionality for note-taking, task management, and
  document organization
- **org-bullets**: Enhanced bullet point styling for better readability
- **org-modern**: Modern UI improvements and menu system for Orgmode
- **headlines**: Enhanced headline styling and visual hierarchy

## Configuration

The orgmode extra automatically configures:

- Project-aware agenda files (`.nvim/orgfiles/**/*` in project root)
- Project-aware notes file (`.nvim/orgfiles/notes.org` in project root)
- Fallback to `~/orgfiles/**/*` and `~/orgfiles/refile.org` outside projects
- LSP support for org files
- Blink completion integration with orgmode sources
- Which-key integration under `<leader>o` prefix

## Usage

1. Import the orgmode xtra:

   ```nix
   { np, ... }:
   {
     imports = [
       np.nixvimModules.base
       np.nixvimModules.xtras.orgmode
     ];
   }
   ```

2. Start using Orgmode with standard keybindings and workflows.
3. Create org files in your project's `.nvim/orgfiles/` directory for
   project-specific notes.
