# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, alex, filepath, happy, hashtables, random }:

cabal.mkDerivation (self: {
  pname = "gtk2hs-buildtools";
  version = "0.13.0.1";
  sha256 = "0ngdg44hxpyga9kwm70340c8jhsh9wl5rja3wx9mfx194idivaxa";
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ filepath hashtables random ];
  buildTools = [ alex happy ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Tools to build the Gtk2Hs suite of User Interface libraries";
    license = self.stdenv.lib.licenses.gpl2;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
