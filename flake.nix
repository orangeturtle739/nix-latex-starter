{
  description = "Latex nix flake example";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";

  outputs = { self, nixpkgs, }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      example = pkgs.stdenv.mkDerivation {
        name = "example.pdf";
        buildInputs = with pkgs;
          [ (texlive.combine { inherit (texlive) scheme-full latexmk; }) ];
        src = self;
        installPhase = "cp example.pdf $out";
      };
    in {
      devShell.${system} = example;
      defaultPackage.${system} = example;
    };
}

