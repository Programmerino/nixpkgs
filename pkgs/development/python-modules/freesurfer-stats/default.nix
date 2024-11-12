{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  wheel,
  numpy,
  pandas
}:

buildPythonPackage rec {
  pname = "freesurfer-stats";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fphammerle";
    repo = "freesurfer-stats";
    rev = "v${version}";
    hash = "sha256-99JAIJes7Fso0ZvvKRZhRuR4DugNWm+mBLuJi91hc0g=";
  };

  build-system = [
    setuptools
    setuptools-scm
    wheel
  ];

  dependencies = [
    numpy
    pandas
  ];

  pythonRelaxDeps = [
    "pandas"
  ];

  pythonImportsCheck = [
    "freesurfer_stats"
  ];

  meta = {
    description = "Python Library to Read FreeSurfer's Cortical Parcellation Anatomical Statistics";
    homepage = "https://github.com/fphammerle/freesurfer-stats.git";
    changelog = "https://github.com/fphammerle/freesurfer-stats/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
}
