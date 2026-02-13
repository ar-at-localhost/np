{
  all = import ./default.nix;
  cpp = import ./cpp.nix;
  css = import ./css.nix;
  docker = import ./docker.nix;
  dotnet = import ./dotnet.nix;
  javascript = import ./javascript.nix;
  make = import ./make.nix;
  mjml = import ./mjml.nix;
  python = import ./python.nix;
  rust = import ./rust.nix;
  sql = import ./sql.nix;
  web = import ./web.nix;
  xml = import ./xml.nix;
}
