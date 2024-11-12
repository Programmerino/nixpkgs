{
  lib,
  stdenv,
  fetchzip,
  xorg,
  libGL,
  libGLU,
  libsForQt5,
  bzip2,
  e2fsprogs,
  autoPatchelfHook,
  dbus,
  libxcrypt-legacy,
  libdrm,
  fontconfig,
  freetype,
  gfortran,
  libgcc,
  glib,
  krb5,
  libjpeg,
  libpng12,
  kdePackages,
  libxkbcommon,
  zlib,
  tcsh
}:

stdenv.mkDerivation rec {
  pname = "freesurfer";
  version = "7.4.1";

  src = fetchzip {
    url = "https://surfer.nmr.mgh.harvard.edu/pub/dist/${pname}/${version}/${pname}-linux-centos8_x86_64-${version}.tar.gz";
    sha256 = "sha256-+JT2396KJcR0dgx9gzY198ehqCACCVBeyT+7mvkLimE=";
  };

  nativeBuildInputs = [
     autoPatchelfHook
  ];

  buildInputs = [
    xorg.libXt
    xorg.libXft
    xorg.libXp
    xorg.libXpm
    xorg.libXext
    xorg.libICE
    xorg.libSM
    xorg.libX11
    xorg.libXcomposite
    xorg.libXi
    xorg.libXmu
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libxcb
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5.qtwebsockets
    libGL
    libGLU
    e2fsprogs
    bzip2
    libxcrypt-legacy
    dbus.lib
    libdrm
    fontconfig.lib
    freetype
    libgcc.lib
    glib
    krb5.lib
    libjpeg
    libpng12
    kdePackages.wayland
    libxkbcommon
    zlib
    gfortran.cc.lib
    tcsh
  ];

  dontWrapQtApps = true;
  autoPatchelfIgnoreMissingDeps = [ "libcuda.so.1" "libgfortran.so.5" "libmwcpp11compat.so" "libmwlaunchermain.so" "libmwmclmcrrt.so.8.3" "libtiff.so.5"];

  installPhase = ''
    mkdir -p $out
    cp -r $src/. $out
  '';
}
