{
  description = "cremniy flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      cremniySrc = pkgs.fetchFromGitHub {
        owner = "igmunv";
        repo = "cremniy";
        rev = "refs/heads/main";
        sha256 = "sha256-l/6+9X8N5xmCs6zXNiBE5ohsyYvo+JJmVyPhS/oHEFk=";
      };
    in
    {

      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "cremniy";
        version = "1.0";

        src = "${cremniySrc}/src";

        buildInputs = [ pkgs.qt6.qtbase ];
        nativeBuildInputs = [
          pkgs.cmake
          pkgs.qt6.wrapQtAppsHook
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
