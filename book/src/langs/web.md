# Web Lang

Full-stack web development support.

## What It Includes

- Imports the `javascript` lang.
- **LSP**: HTML, CSS, Tailwind CSS.
- **Formatters**: For HTML/CSS.
- **Tree-Sitter**: CSS, HTML, HTTP, SQL, XML.

## Usage

```nix
imports = [
  inputs.np.nixvimModules.base
  inputs.np.nixvimModules.langs.web
];
```

## Notes

Covers front-end and some back-end tools.
