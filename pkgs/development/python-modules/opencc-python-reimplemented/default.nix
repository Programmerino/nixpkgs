{
  lib,
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "opencc-python-reimplemented";
  version = "0.1.7";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-T3d+o0YaJSV6e4dhEs+pC7asq8bfuEO/TREmbkNXne4=";
  };

  # No dependencies required
  propagatedBuildInputs = [ ];

  # No tests in the PyPI package
  doCheck = false;

  pythonImportsCheck = [ "opencc" ];

  meta = with lib; {
    description = "Pure Python implementation of Open Chinese Convert";
    homepage = "https://github.com/yichen0831/opencc-python";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}