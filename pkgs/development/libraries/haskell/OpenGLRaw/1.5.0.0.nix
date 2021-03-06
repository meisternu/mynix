# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, mesa }:

cabal.mkDerivation (self: {
  pname = "OpenGLRaw";
  version = "1.5.0.0";
  sha256 = "04lsidv82fl7yb2fnqpx7q0vgiwxbswh8g7dv9q9s9i2jwiaaal5";
  extraLibraries = [ mesa ];
  meta = {
    homepage = "http://www.haskell.org/haskellwiki/Opengl";
    description = "A raw binding for the OpenGL graphics system";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
