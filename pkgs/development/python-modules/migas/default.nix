{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  ci-info,
  black,
  isort,
  pre-commit,
  looseversion,
  pytest,
  requests,
}:

buildPythonPackage rec {
  pname = "migas";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nipreps";
    repo = "migas-py";
    rev = version;
    hash = "sha256-k3r371ucp1LJWds0JkFAXo8gGOc3uWLqRmsuffK2YMU=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    ci-info
  ];

  optional-dependencies = {
    dev = [
      black
      isort
      pre-commit
    ];
    test = [
      looseversion
      pytest
      requests
    ];
  };

  pythonImportsCheck = [
    "migas"
  ];

  meta = {
    description = "A ready-to-go python package for communicating with a migas server";
    homepage = "https://github.com/nipreps/migas-py.git";
    changelog = "https://github.com/nipreps/migas-py/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
