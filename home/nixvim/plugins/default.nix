{ host, ... }:

{
  imports = [
    ./cmp.nix
    ./dap.nix
    (import ./lsp { inherit host; })
    ./snacks.nix
    ./supermaven.nix
  ];
}
