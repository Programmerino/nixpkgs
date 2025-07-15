{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  numpy,
  transformers,
  datasets,
  lightning,
  hydra-core,
  tensorboard,
  natsort,
  einops,
  librosa,
  rich,
  gradio,
  wandb,
  grpcio,
  kui,
  uvicorn,
  loguru,
  loralib,
  pyrootutils,
  vector-quantize-pytorch,
  resampy,
  einx,
  zstandard,
  pydub,
  pyaudio,
  faster-whisper,
  modelscope,
  funasr,
  opencc-python-reimplemented,
  pysilero-vad,
  ormsgpack,
  tiktoken,
  pydantic,
  cachetools,
  torch,
  torchaudio,
  sox,
  ffmpeg,
}:

buildPythonPackage rec {
  pname = "fish-speech";
  version = "1.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fishaudio";
    repo = "fish-speech";
    rev = "v${version}";
    hash = "sha256-/PH2or5fvfb2+OgN6Wfg76ZyBo+fsAIVuQFrTtIzia8=";
  };

  postPatch = ''
    # Remove version pinning for compatibility
    substituteInPlace pyproject.toml \
      --replace "numpy<=1.26.4" "numpy" \
      --replace "torch<=2.4.1" "torch" \
      --replace "setuptools==69.5.1" "setuptools" \
      --replace "datasets==2.18.0" "datasets" \
      --replace "einx==0.2.2" "einx" \
      --replace "pydantic==2.9.2" "pydantic" \
      --replace "silero-vad" "pysilero-vad"
  '';

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [
    numpy
    transformers
    datasets
    lightning
    hydra-core
    tensorboard
    natsort
    einops
    librosa
    rich
    gradio
    wandb
    grpcio
    kui
    uvicorn
    loguru
    loralib
    pyrootutils
    vector-quantize-pytorch
    resampy
    einx
    zstandard
    pydub
    pyaudio
    faster-whisper
    modelscope
    funasr
    opencc-python-reimplemented
    pysilero-vad
    ormsgpack
    tiktoken
    pydantic
    cachetools
    torch
    torchaudio
  ];

  buildInputs = [
    sox
    ffmpeg
  ];

  # Tests require network access and models
  doCheck = false;
  
  # Disable runtime dependency check since Nix handles dependencies differently
  dontCheckRuntimeDeps = true;

  pythonImportsCheck = [ "fish_speech" ];

  meta = with lib; {
    description = "Brand new TTS solution (rebranded as OpenAudio)";
    homepage = "https://github.com/fishaudio/fish-speech";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}