{ stdenv, fetchurl, lua5, webkitgtk2, libunique, sqlite, pkgconfig, gtk, libsoup, git, lua5_filesystem, glib_networking, gsettings_desktop_schemas, makeWrapper, help2man }:

stdenv.mkDerivation rec {

  name = "luakit"; 
  version = "2012.09.13-r1";

  src = fetchurl {
    url = "https://github.com/mason-larobina/${name}/archive/${version}.tar.gz";
    sha256 = "067g3bp5w20jypc8rx54dpbn3ysbgxzchgpq7sld5yh2z36s1l52";
  };

  buildInputs = [ lua5 webkitgtk2 libunique sqlite pkgconfig gtk libsoup git makeWrapper gsettings_desktop_schemas help2man ];
  postPatch = '' 
    sed -i -e "s/DESTDIR/INSTALLDIR/" ./Makefile
    sed -i -e "s|/etc/xdg/luakit/|$out/etc/xdg/luakit/|" lib/lousy/util.lua
    patchShebangs ./build-utils
  '';

  buildPhase = '' 
    make DEVELOPMENT_PATHS=0 PREFIX=$out 
  '';
  
  installPhase = '' 
    make DEVELOPMENT_PATHS=0 PREFIX=$out install 
    wrapProgram "$out/bin/luakit"                                                       \
        --prefix GIO_EXTRA_MODULES : "${glib_networking}/lib/gio/modules"                 \
        --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH:$out/share"                     \
        --prefix XDG_DATA_DIRS : "$out/usr/share/"                                        \
        --prefix XDG_DATA_DIRS : "$out/share/"                                            \
        --prefix XDG_CONFIG_DIRS : "$out/etc/xdg"                                         \
        --prefix LUA_PATH    ";" "$out/share/luakit/lib/?/init.lua"                       \
        --prefix LUA_PATH    ";" "$out/share/luakit/lib/?.lua"                            \
        --prefix LUA_CPATH   ";" "${lua5_filesystem}/lib/lua/${lua5.luaversion}/?.so"     \
        --prefix LUA_CPATH   ";" "${lua5}/lib/lua/${lua5.luaversion}/?.so"
  '';

  meta = {
    homepage = "http://mason-larobina.github.io/luakit/";
    description = "Fast, small, webkit based browser framework extensible by Lua";
    platforms = stdenv.lib.platforms.linux;
    maintainers = [ stdenv.lib.maintainers.meisternu ];
  };
}
