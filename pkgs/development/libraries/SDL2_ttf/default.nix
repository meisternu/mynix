{ stdenv, fetchurl, SDL2, freetype }:

stdenv.mkDerivation {
  name = "SDL2_ttf-2.0.12";

  src = fetchurl {
    url = http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.12.tar.gz;
    sha256 = "8728605443ea1cca5cad501dc34dc0cb15135d1e575551da6d151d213d356f6e";
  };

  buildInputs = [SDL2 freetype];

  postInstall = "ln -s $out/include/SDL/SDL_ttf.h $out/include/";

  meta = {
    description = "SDL TrueType library";
  };
}
