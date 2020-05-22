{ stdenv, fetchFromGitHub, pkgconfig, writeText, libX11 }:

with stdenv.lib;

stdenv.mkDerivation rec {
  pname = "slstatus";
  version = "customized-by-ivxvm";

  src = fetchFromGitHub {
    owner = "ivxvm";
    repo = "slstatus-ivxvm";
    rev = "054e5c0e92624358d2f12affb2f038f12d5dffd8";
    sha256 = "1ypw09wg2cw6py0fc49z7vmrpj1g692j5rfshyv4kn4spacd6zc6";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ libX11 ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = {
    homepage = "https://tools.suckless.org/slstatus/";
    description = "status monitor for window managers that use WM_NAME like dwm";
    license = licenses.isc;
    maintainers = with maintainers; [ geistesk ];
    platforms = platforms.linux;
  };
}
