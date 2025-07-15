{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  pdm-pep517,
  baize,
  pydantic,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "kui";
  version = "1.9.2";
  pyproject = true;

  disabled = pythonOlder "3.9";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FgmUPgYcjumvB5aRRa1eqyzHnbXwazPDhe8R6l0693w=";
  };

  nativeBuildInputs = [
    pdm-pep517
  ];

  propagatedBuildInputs = [
    baize
    pydantic
    typing-extensions
  ];

  # Package does not have tests on PyPI
  doCheck = false;

  pythonImportsCheck = [ "kui" ];

  meta = with lib; {
    description = "A lightweight web framework based on baize and pydantic";
    homepage = "https://github.com/abersheeran/kui";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}