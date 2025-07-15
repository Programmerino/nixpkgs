{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  # Core dependencies
  addict,
  attrs,
  datasets,
  einops,
  oss2,
  pillow,
  python-dateutil,
  requests,
  scipy,
  simplejson,
  sortedcontainers,
  transformers,
  tqdm,
  urllib3,
  # Optional dependencies
  funasr,
}:

buildPythonPackage rec {
  pname = "modelscope";
  version = "1.17.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "modelscope";
    repo = "modelscope";
    rev = "v${version}";
    hash = "sha256-l0DDeq7AgsgXQBVQyri+VnaCuwSH4evc5SJtX9ba+Lw=";
  };

  postPatch = ''
    # Create a simplified setup.py that doesn't do complex preprocessing
    cat > setup.py << 'EOF'
from setuptools import setup, find_packages

def readme():
    with open('README.md', encoding='utf-8') as f:
        return f.read()

setup(
    name='modelscope',
    version='${version}',
    description='ModelScope: bring the notion of Model-as-a-Service to life.',
    long_description=readme(),
    long_description_content_type='text/markdown',
    author='ModelScope team',
    author_email='contact@modelscope.cn',
    keywords='python,nlp,science,cv,speech,multi-modal',
    url='https://github.com/modelscope/modelscope',
    packages=find_packages(exclude=('configs', 'demo')),
    include_package_data=True,
    package_data={"": ["*.h", "*.cpp", "*.cu"]},
    classifiers=[
        'Development Status :: 4 - Beta',
        'License :: OSI Approved :: Apache Software License',
        'Operating System :: OS Independent',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: 3.10',
        'Programming Language :: Python :: 3.11',
    ],
    license='Apache License 2.0',
    entry_points={
        'console_scripts': ['modelscope=modelscope.cli.cli:run_cmd']
    },
    zip_safe=False
)
EOF

    # Ensure version.py exists with correct version
    echo "__version__ = '${version}'" > modelscope/version.py
    echo "__release_datetime__ = '2024-08-08 23:59:59'" >> modelscope/version.py
  '';

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [
    addict
    attrs
    datasets
    einops
    oss2
    pillow
    python-dateutil
    requests
    scipy
    simplejson
    sortedcontainers
    transformers
    tqdm
    urllib3
  ];

  passthru.optional-dependencies = {
    audio = [
      funasr
    ];
  };

  # No tests in the PyPI package
  doCheck = false;

  pythonImportsCheck = [ "modelscope" ];

  meta = with lib; {
    description = "ModelScope: bring the notion of Model-as-a-Service to life";
    homepage = "https://github.com/modelscope/modelscope";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}