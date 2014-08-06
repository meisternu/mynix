# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, autoUpdate, blazeBuilder, byteorder, caseInsensitive
, doctest, fastLogger, httpTypes, network, unixTime, wai
}:

cabal.mkDerivation (self: {
  pname = "wai-logger";
  version = "2.2.0";
  sha256 = "0dl4c9b1yl22df421p6yw405bv1skvh6dk5rgybxz1sspvb94gvy";
  buildDepends = [
    autoUpdate blazeBuilder byteorder caseInsensitive fastLogger
    httpTypes network unixTime wai
  ];
  testDepends = [ doctest ];
  doCheck = false;
  meta = {
    description = "A logging system for WAI";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
