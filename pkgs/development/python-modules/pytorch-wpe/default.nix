{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  numpy,
  torch,
  torch-complex,
}:

buildPythonPackage rec {
  pname = "pytorch-wpe";
  version = "0.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pytorch_wpe";
    inherit version;
    hash = "sha256-/H5wa1QRgAxEg/6U233Nguz2xXvAE69SmrT7Z1ycwpw=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    numpy
    torch
    torch-complex
  ];

  # Package does not have tests
  doCheck = false;

  pythonImportsCheck = [ "pytorch_wpe" ];

  meta = with lib; {
    description = "PyTorch implementation of Weighted Prediction Error for speech dereverberation";
    homepage = "https://github.com/nttcslab-sp/dnn_wpe";
    license = licenses.free; # NTT license
    maintainers = with maintainers; [ ];
  };
}