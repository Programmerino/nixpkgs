{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  torch,
}:

buildPythonPackage rec {
  pname = "loralib";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Isz/SUpiVLlz3a7p+arUZXlByrQiHHXFoE4MrE+9RWc=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    torch
  ];

  # No tests in the PyPI package
  doCheck = false;

  pythonImportsCheck = [ "loralib" ];

  meta = with lib; {
    description = "PyTorch implementation of low-rank adaptation (LoRA)";
    homepage = "https://github.com/microsoft/LoRA";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}