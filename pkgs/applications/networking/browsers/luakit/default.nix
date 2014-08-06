{ stdenv, fetchurl, lua5, webkitgtk2, libunique, sqlite, pkgconfig, gtk, libsoup, git, lua5_filesystem, makeWrapper, help2man }:

stdenv.mkDerivation rec {
  name = "luakit-${version}"; 
  version = "2012.09.13-r1";
  src = fetchurl {
    url = "https://github.com/mason-larobina/luakit/tarball/${version}";
    name = "luakit-${version}.tar.gz";
    sha256 = "0ck1yw08nx6wklzjjlh5ljxza6zw0mjvlllbk5v2j0qzl7ym12b8";
  };

  buildInputs = [ lua5 webkitgtk2 libunique sqlite pkgconfig gtk libsoup git makeWrapper help2man ];
  
  buildPhase = '' 
    make DEVELOPMENT_PATHS=0 PREFIX=$out 
  '';
  
  installPhase = '' 
    make DEVELOPMENT_PATHS=0 PREFIX=$out install 
  '';

  meta = {
    homepage = "http://mason-larobina.github.io/luakit/";
    description = "Fast, small, webkit based browser framework extensible by Lua.";
    platforms = stdenv.lib.platforms.linux;
    maintainers = [ stdenv.lib.maintainers.meisternu ];
  };
}
