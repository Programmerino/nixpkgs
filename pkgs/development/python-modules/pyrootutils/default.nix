{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  python-dotenv,
}:

buildPythonPackage rec {
  pname = "pyrootutils";
  version = "1.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9YqsZxR7urIJOLe3g8svRnDWMpozxmQCM4VJdlOPxfI=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    python-dotenv
  ];

  # Package does not have tests on PyPI
  doCheck = false;

  pythonImportsCheck = [ "pyrootutils" ];

  meta = with lib; {
    description = "Simple package for easy project root setup";
    homepage = "https://github.com/ashleve/pyrootutils";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}