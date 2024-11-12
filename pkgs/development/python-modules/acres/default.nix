{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  importlib-resources,
}:

buildPythonPackage rec {
  pname = "acres";
  version = "0.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nipreps";
    repo = "acres";
    rev = version;
    hash = "sha256-XjbqpDDi+WWIp1v8LsWz4rXPgCLpfbZReWXJYDma1JU=";
  };

  build-system = [
    flit-core
  ];

  dependencies = [
    importlib-resources
  ];

  pythonImportsCheck = [
    "acres"
  ];

  meta = {
    description = "Data-loading utility for Python";
    homepage = "https://github.com/nipreps/acres.git";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
