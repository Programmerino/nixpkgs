{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  nipreps-versions,
  joblib,
  numpy,
  pandas,
  scikit-learn,
  mriqc-learn,
  furo,
  pydot,
  # pydotplus,
  sphinx,
  sphinxcontrib-apidoc,
  # sphinxcontrib-napoleon,
  psutil,
  codecov,
  coverage,
  pytest,
  pytest-cov,
  pytest-env,
  pytest-xdist,
}:

buildPythonPackage rec {
  pname = "mriqc-learn";
  version = "0.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nipreps";
    repo = "mriqc-learn";
    rev = version;
    hash = "sha256-Pm9gbKstjC1cDwxKfC6f5HMOgQ0Mp44hQrmdSGx4jps=";
  };

  build-system = [
    hatch-vcs
    hatchling
    nipreps-versions
  ];

  dependencies = [
    joblib
    numpy
    pandas
    scikit-learn
  ];

  optional-dependencies = {
    all = [
      mriqc-learn
    ];
    doc = [
      furo
      pydot
      # pydotplus
      sphinx
      sphinxcontrib-apidoc
      # sphinxcontrib-napoleon
    ];
    docs = [
      mriqc-learn
    ];
    mem = [
      psutil
    ];
    test = [
      codecov
      coverage
      pytest
      pytest-cov
      pytest-env
      pytest-xdist
    ];
    tests = [
      mriqc-learn
    ];
  };

  pythonImportsCheck = [
    "mriqc_learn"
  ];

  meta = {
    description = "Learning on MRIQC-generated image quality metrics (IQMs";
    homepage = "https://github.com/nipreps/mriqc-learn.git";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
