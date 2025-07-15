{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  scipy,
  librosa,
  jamo,
  pyyaml,
  soundfile,
  kaldiio,
  torch-complex,
  sentencepiece,
  jieba,
  pytorch-wpe,
  editdistance,
  oss2,
  tqdm,
  umap-learn,
  jaconv,
  hydra-core,
  tensorboardx,
  requests,
  torch,
  torchaudio,
}:

buildPythonPackage rec {
  pname = "funasr";
  version = "1.1.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1vj47VPHWufcQeM8Ycr9i41tCADftB641lnqoe86pTk=";
  };

  postPatch = ''
    # Remove deprecated pytest-runner from setup requirements
    substituteInPlace setup.py \
      --replace '"pytest-runner",' ""
  '';

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    scipy
    librosa
    jamo
    pyyaml
    soundfile
    kaldiio
    torch-complex
    sentencepiece
    jieba
    pytorch-wpe
    editdistance
    oss2
    tqdm
    umap-learn
    jaconv
    hydra-core
    tensorboardx
    requests
    torch
    torchaudio
  ];

  # No tests in the PyPI package
  doCheck = false;

  pythonImportsCheck = [ "funasr" ];

  meta = with lib; {
    description = "FunASR: A Fundamental End-to-End Speech Recognition Toolkit";
    homepage = "https://github.com/alibaba/FunASR";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}