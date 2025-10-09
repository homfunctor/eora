{pkgs}: let
  inherit
    (pkgs)
    fetchFromGitHub
    python3
    ;
in
  python3.pkgs.buildPythonApplication rec {
    pname = "zipunicode";
    version = "1.1.0";
    format = "pyproject";

    src = fetchFromGitHub {
      owner = "Dragon2fly";
      repo = "ZipUnicode";
      rev = "412b9422469069fe580c219ef683639a4192e088";
      hash = "sha256-aMYCLyNYQ5QbmhrUlGKPUqkQVmOuTDXbBqPwrIPC9R4=";
    };

    nativeBuildInputs = with python3.pkgs; [
      setuptools
      wheel
    ];

    propagatedBuildInputs = with python3.pkgs; [
      chardet
    ];

    meta = {
      description = "Extract zip file with correct encoding.";
      homepage = "https://github.com/Dragon2fly/ZipUnicode";
    };
  }
