{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  numpy,
  packaging,
  torch,
}:

buildPythonPackage rec {
  pname = "torch-complex";
  version = "0.4.4";
  pyproject = true;

  src = fetchPypi {
    pname = "torch_complex";
    inherit version;
    hash = "sha256-QVP9aySgutaJ5vGTv70A84KDsYkNgIvvaE3cbR9j/T8=";
  };

  postPatch = ''
    # Remove pytest-runner which is not needed at runtime
    substituteInPlace setup.py \
      --replace "setup_requires=['pytest-runner']," ""
  '';

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    numpy
    packaging
    torch
  ];

  # Package does not have tests
  doCheck = false;

  pythonImportsCheck = [ "torch_complex" ];

  meta = with lib; {
    description = "Temporary package for complex tensors in PyTorch";
    homepage = "https://github.com/kamo-naoyuki/pytorch_complex";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}