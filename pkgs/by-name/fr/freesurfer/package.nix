{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  gfortran,
  unixtools,
  zlib,
  itk,
  petsc,
  ann,
  gts,
  vtk,
  opencv,
  openssl,
  xorg,
  libsForQt5,
  python3,
  blas,
  lapack
}:

stdenv.mkDerivation rec {
  pname = "freesurfer";
  version = "8.0.0-beta";

  src = fetchFromGitHub {
    owner = "freesurfer";
    repo = "freesurfer";
    rev = version;
    hash = "sha256-2JjY0QofLnPoX/9h8hRIW1KbnRo1ZFiw0isRwFG7VZg=";
  };

  nativeBuildInputs = [
    cmake
    gfortran
    unixtools.xxd
  ];

  cmakeFlags = [
    "-DBLAS_LIBRARIES=-lblas"
    "-DLAPACK_LIBRARIES=-llapack"
  ];

  buildInputs = [
    zlib
    itk
    petsc
    ann
    gts
    vtk
    opencv
    openssl
    xorg.libXmu
    xorg.libXt
    xorg.libX11
    xorg.xorgproto
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtx11extras
    libsForQt5.qt5.wrapQtAppsHook
    python3
    blas
    lapack
    gfortran.cc.lib
  ];

  FS_PACKAGES_DIR="x";
  # preConfigure = ''
  #   ln -s ${itk} packages/itk
  #   ln -s ${petsc} packages/petsc
  #   ln -s ${ann} packages/ann
  #   ln -s ${gts} packages/gts
  #   ln -s ${vtk} packages/vtk
  # '';

  meta = {
    description = "Neuroimaging analysis and visualization suite";
    homepage = "https://github.com/freesurfer/freesurfer.git";
    #license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ ];
    mainProgram = "freesurfer";
    platforms = lib.platforms.all;
  };
}
