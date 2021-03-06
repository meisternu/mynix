{ stdenv, fetchurl, ncurses, which, perl, gnutls
, imapSupport ? true
, headerCache ? true
, gpgmeSupport ? true
, gdbm ? null
, openssl ? null
, cyrus_sasl ? null
, gpgme ? null
}:

assert headerCache -> gdbm != null;

let
  version = "1.5.23";
in
stdenv.mkDerivation rec {
  name = "mutt-${version}";
  
  src = fetchurl {
    url = "mirror://sourceforge/mutt/${name}.tar.gz";
    sha256 = "0dzx4qk50pjfsb6cs5jahng96a52k12f7pm0sc78iqdrawg71w1s";
  };

  buildInputs = [
    ncurses which perl gnutls
    (if headerCache then gdbm else null)
    (if gpgmeSupport then gpgme else null)
    (if gpgmeSupport then gpgme else null) 
 ];
  
  configureFlags = [
    "--with-mailpath=" "--enable-smtp"

    # This allows calls with "-d N", that output debug info into ~/.muttdebug*
    "--enable-debug"

    "--enable-pop" "--enable-imap"

    # The next allows building mutt without having anything setgid
    # set by the installer, and removing the need for the group 'mail'
    # I set the value 'mailbox' because it is a default in the configure script
    "--with-homespool=mailbox"
    
    # Enable gnutls support
    "--with-gnutls"

    (if headerCache then "--enable-hcache" else "--disable-hcache")
    (if imapSupport then "--enable-imap" else "--disable-imap")
    (if gpgmeSupport then "--enable-gpgme" else "--disable-gpgme")
 
  ];

  meta = with stdenv.lib; {
    description = "A small but very powerful text-based mail client";
    homepage = http://www.mutt.org;
    license = stdenv.lib.licenses.gpl2Plus;
    platforms = platforms.unix;
    maintainers = with maintainers; [ the-kenny ];
  };
}
