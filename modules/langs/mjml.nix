_: {
  imports = [./css.nix ./xml.nix];

  extraConfigLuaPre = ''
    vim.filetype.add({
      extension = {
        mjml = "xml",
      },
    })

    vim.treesitter.query.set(
      "xml",
      "injections",
      [[
      ((element
         (STag (Name) @_name)
         (content (CharData) @injection.content))
       (#eq? @_name "mj-style")
       (#set! injection.language "css"))
      ]]
    )
  '';
}
