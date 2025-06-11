{pkgs, ...}: let
  inherit
    (pkgs)
    fetchFromGitHub
    python3Packages
    ;

  pname = "ZipUnicode";
  version = "1.1.0";
in
  python3Packages.buildPythonApplication {
    inherit pname version;

    pyproject = true;

    src = fetchFromGitHub {
      hash = "sha256-aMYCLyNYQ5QbmhrUlGKPUqkQVmOuTDXbBqPwrIPC9R4=";
      owner = "Dragon2fly";
      repo = pname;
      rev = "412b9422469069fe580c219ef683639a4192e088";
    };

    nativeBuildInputs = with python3Packages; [
      setuptools
      wheel
    ];

    propagatedBuildInputs = with python3Packages; [
      chardet
    ];

    doCheck = false;
  }
