{ stdenv, fetchurl, buildPerlPackage }:

buildPerlPackage rec {
  name = "Archive-Extract-0.72";

  src = fetchurl {
    url = "mirror://cpan/authors/id/B/BI/BINGOS/${name}.tar.gz";
    sha256 = "e86acd52e75a7cc3cb602a3b84c831cb408067b4ad2d7fb7ba122d156fd745df";
  };

  meta = {
    homepage = http://search.cpan.org/dist/Archive-Extract/;
    description = "Archiving tools for perl";
    license = "perl";
    platforms = stdenv.lib.platforms.linux;
  };
}
