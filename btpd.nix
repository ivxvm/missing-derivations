with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "btpd";
  buildInputs = [ openssl ];
  src = fetchFromGitHub {
    owner = "btpd";
    repo = "btpd";
    rev = "a3a10dfe1ece4a726530353a7b208c0cb4ff7e0d";
    sha256 = "0cdhr6ipk14x78ynxb01gl4cr0fsdxclhxyiq8d2s6352wkf3fzl";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -f btpd/btpd cli/btcli info/btinfo $out/bin
    chmod 755 $out/bin/btpd
    chmod 755 $out/bin/btcli
    chmod 755 $out/bin/btinfo

    mkdir -p $out/share/man/man1
    cp -f doc/*.1 $out/share/man/man1
    chmod 644 $out/share/man/man1/btpd.1
    chmod 644 $out/share/man/man1/btcli.1
    chmod 644 $out/share/man/man1/btinfo.1
  '';
}
