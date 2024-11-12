{
  stdenv,
  fetchzip
}:

stdenv.mkDerivation rec {
  pname = "ann";
  version = "1.1.2";

  src = fetchzip {
    url = "https://www.cs.umd.edu/~mount/ANN/Files/${version}/${pname}_${version}.tar.gz";
    hash = "sha256-Mz+pXBxdPqqaZB45NFkJyiwgScsEx+/JaKm0AYfqUo0=";
  };

  buildPhase = ''
    make linux-g++
  '';

  installPhase = ''
    mkdir -p $out
    cp -r include $out/
    cp -r lib $out/
  '';
}
