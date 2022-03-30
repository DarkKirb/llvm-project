{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in with pkgs;
    {
      devShell = mkShell {
        buildInputs = with llvmPackages_latest; [
          clangUseLLVM
          llvm
          lld
          lldb
          cmake
          ninja
        ];
      };
    });
}
