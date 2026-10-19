{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    nixd
    nixfmt
    stylua
    shfmt
    gofumpt
  ];

  shellHook = ''
    echo "Nix dev shell loaded (nixd LSP available)"
  '';
}
