# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, attoparsec, blazeBuilder, deepseq, dlist, hashable, HUnit
, mtl, QuickCheck, scientific, syb, testFramework
, testFrameworkHunit, testFrameworkQuickcheck2, text, time
, unorderedContainers, vector
}:

cabal.mkDerivation (self: {
  pname = "aeson";
  version = "0.8.0.0";
  sha256 = "0p2x03wjawhav87jp57vwclra0gjwn1gqk74zgnji25ypwsvgkk4";
  buildDepends = [
    attoparsec blazeBuilder deepseq dlist hashable mtl scientific syb
    text time unorderedContainers vector
  ];
  testDepends = [
    attoparsec HUnit QuickCheck testFramework testFrameworkHunit
    testFrameworkQuickcheck2 text time unorderedContainers vector
  ];
  meta = {
    homepage = "https://github.com/bos/aeson";
    description = "Fast JSON parsing and encoding";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
