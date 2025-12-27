# Contributing

## Development Setup

1. Clone / Fork the repo.
2. Enter the dev shell: `nix develop`
3. Create a branch from main
4. Make changes.
5. Create a commit (Please follow conventional commitlint)
6. Push
7. Open a PR.

> [!NOTE]
> Flake is configured to auto-run Flake checks, and Lints.

--

> [!TIP]
> Repo itself is configured to use `np` itself.
> `nvim` inside repo default shell, is `np`.

## Guidelines

- **Project Oriented Development (POD)**: POD cannot be sacrificed under any
  condition. Contributions that pollute the user's home directory or OS will
  not be merged. All configurations must remain project-specific and isolated.
- **Keybindings**: Keys must be grouped logically, prioritizing usability over
  traditional conventions. This may or may not align with standard traditions.
- Follow NixVim best practices.
- Keep presets minimal and focused.
- Update docs for any changes.
- Strictly follow No Pollution policy.
- Create Lint-free Contributions.
