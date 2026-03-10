_: let
  web-formatters = {
    __unkeyed-1 = "biome";
    __unkeyed-2 = "prettierd";
    __unkeyed-3 = "prettier";
    stop_after_first = true;
  };
in {
  inherit web-formatters;
}
