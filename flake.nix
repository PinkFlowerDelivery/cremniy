{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation rec {
        pname = "cremniy";
        version = "dev";

        src = ./src;

        nativeBuildInputs = [
          pkgs.cmake
          pkgs.qt6.wrapQtAppsHook
          pkgs.qt6.qttools
        ];

        buildInputs = [
          pkgs.qt6.qtbase
        ];

        installPhase = ''
          mkdir -p $out/bin
          mkdir build && cd build
          cmake ${src} -DCMAKE_BUILD_TYPE=Release
          cmake --build . --config Release
          cp cremniy $out/bin/
        '';
      };
    };
}
