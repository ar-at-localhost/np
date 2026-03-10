_: {
  imports = [./css.nix ./xml.nix];

  plugins = {
    treesitter.languageRegister.xml = ["mjml"];

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          xml = {
            unkeyed-2 = "injected";
          };
        };
      };
    };
  };

  extraConfigLuaPre = ''
    vim.filetype.add({
      extension = {
        mjml = "xml",
      },
    })

    vim.treesitter.query.set("xml", "injections", [[
      ((element
         (STag (Name) @_name)
         (content (CharData) @injection.content))
       (#eq? @_name "mj-style")
       (#set! injection.language "css"))
    ]])
  '';
}
