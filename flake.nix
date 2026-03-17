{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      src = pkgs.fetchFromGitHub {
        owner = "igmunv";
        repo = "cremniy";
        rev = "refs/heads/main";
      };
    in
    {
      packages.${system}.cremniy = pkgs.stdenv.mkDerivation {
        pname = "cremniy";
        version = "1.0";

        src = src;

        buildInputs = with pkgs; [ qt6.qtbase ];
        nativeBuildInputs = with pkgs; [
          cmake
          qt6.wrapQtAppsHook
        ];

        buildPhase = ''
          mkdir -p build
          cd build
          cmake $src -DCMAKE_INSTALL_PREFIX=$out
          cmake --build .
        '';

        installPhase = ''
          cmake --install .
        '';

      };
    };
}
