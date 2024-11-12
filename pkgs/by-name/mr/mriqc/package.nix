{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "mriqc";
  version = "24.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nipreps";
    repo = "mriqc";
    rev = version;
    hash = "sha256-Ej4FQaOJ8yW12szHQbDl6WvrTymCcD4L9a+3VmMoZR0=";
  };

  build-system = [
    python3.pkgs.hatch-vcs
    python3.pkgs.hatchling
    python3.pkgs.nipreps-versions
  ];

  dependencies = with python3.pkgs; [
    acres
    dipy
    importlib-resources
    markupsafe
    matplotlib
    migas
    mriqc-learn
    nibabel
    nilearn
    nipype
    nireports
    nitransforms
    niworkflows
    numpy
    orjson
    pandas
    pybids
    pyyaml
    scikit-learn
    scipy
    statsmodels
    templateflow
    toml
    tomli
    torch
  ];

  optional-dependencies = with python3.pkgs; {
    all = [
      mriqc
    ];
    container = [
      datalad
      datalad-osf
    ];
    dev = [
      ruff
    ];
    doc = [
      nipype
      packaging
      pydot
      pydotplus
      sphinx
      sphinx-argparse
      sphinx-rtd-theme
    ];
    docs = [
      mriqc
    ];
    notebook = [
      ipython
      jupyter
      nipy
    ];
    other = [
      nitime
      scikit-image
      seaborn
      xvfbwrapper
    ];
    others = [
      mriqc
    ];
    rodents = [
      nirodents
    ];
    test = [
      coverage
      mock
      pytest
      pytest-cov
      pytest-env
      pytest-xdist
    ];
    tests = [
      mriqc
    ];
  };

  pythonRelaxDeps = [
    "markupsafe"
    "nitransforms"
  ];

  pythonImportsCheck = [
    "mriqc"
  ];

  meta = {
    description = "Automated Quality Control and visual reports for Quality Assessment of structural (T1w, T2w) and functional MRI of the brain";
    homepage = "https://github.com/nipreps/mriqc.git";
    changelog = "https://github.com/nipreps/mriqc/blob/${src.rev}/CHANGES.rst";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "mriqc";
  };
}
