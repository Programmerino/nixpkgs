{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  einops,
  einx,
  torch,
}:

buildPythonPackage rec {
  pname = "vector-quantize-pytorch";
  version = "1.14.24";
  pyproject = true;

  src = fetchPypi {
    pname = "vector_quantize_pytorch";
    inherit version;
    hash = "sha256-j0LXglWChRw0IPjgln2h1MP9gReklBRd/eeLdb9BryY=";
  };

  nativeBuildInputs = [
    hatchling
  ];

  propagatedBuildInputs = [
    einops
    einx
    torch
  ];

  # Package has no tests
  doCheck = false;

  pythonImportsCheck = [ "vector_quantize_pytorch" ];

  meta = with lib; {
    description = "Vector Quantization, in PyTorch";
    homepage = "https://github.com/lucidrains/vector-quantize-pytorch";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}