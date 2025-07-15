{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  numpy,
}:

buildPythonPackage rec {
  pname = "kaldiio";
  version = "2.18.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AoPRl/rGrGg/ep5q+NGKrZ29LEqZfyLkUpTyrB7jxDI=";
  };

  postPatch = ''
    # Remove pytest-runner which is not needed at runtime
    substituteInPlace setup.py \
      --replace "setup_requires=[\"pytest-runner\"]," ""
  '';

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    numpy
  ];

  # Package does not have tests on PyPI
  doCheck = false;

  pythonImportsCheck = [ "kaldiio" ];

  meta = with lib; {
    description = "Kaldi-ark loading and writing module";
    homepage = "https://github.com/nttcslab-sp/kaldiio";
    license = licenses.free; # No explicit license mentioned
    maintainers = with maintainers; [ ];
  };
}