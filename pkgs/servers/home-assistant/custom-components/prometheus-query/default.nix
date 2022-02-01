{ stdenv
, lib
, fetchFromGitHub
}:

let
  pname = "prometheus_sensor";
  version = "1.0.0";
in
stdenv.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "mweinelt";
    repo = "ha-prometheus-sensor";
    rev = version;
    hash = "sha256:10plx1x61ndg5a6jsj7lwfv1s96a6jbwgwnj72y9k6pgaln8wh6p";
  };

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    mkdir $out
    cp -rv $src/custom_components/${pname} $out/
  '';

  meta = with lib; {
    description = "Import prometheus query results into Home Assistant";
    homepage = "https://github.com/mweinelt/ha-prometheus-sensor";
    maintainers = with maintainers; [ hexa ];
    license = licenses.mit;
  };
}

