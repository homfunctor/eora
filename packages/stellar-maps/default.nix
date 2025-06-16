# todo: finish this. doesn't work yet.
# StellarMaps_0.12.4_Linux.AppImage
{pkgs, ...}: let
  inherit
    (pkgs)
    appimageTools
    fetchurl
    lib
    ;

  pname = "stellar-maps";
  version = "0.12.4";

  src = fetchurl {
    hash = "sha256-5PdxPPxC5PMFsuEiwrV0fSzhFCR4O2TTfqdrcrkQT+U=";
    url = "https://github.com/oatmealproblem/stellarmaps/releases/download/stellarmaps-v${version}/StellarMaps_${version}_Linux.AppImage";
  };

  appimageContents = appimageTools.extractType1 {
    inherit pname version src;
  };
in
  appimageTools.wrapType2 rec
  {
    inherit pname version src;

    # todo: wrap
    # source "${dieHook}/nix-support/setup-hook"
    # source "${makeWrapper}/nix-support/setup-hook"
    #
    # wrapProgram $out/bin/${pname} \
    # --set SDL_VIDEODRIVER wayland
    #

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      cp -r ${appimageContents}/usr/share/icons $out/share
    '';

    meta = {
      description = "Stylized maps from Stellaris saves";
      downloadPage = "https://github.com/oatmealproblem/stellarmaps/releases";
      homepage = "https://github.com/oatmealproblem/stellarmaps";
      license = lib.licenses.mit;
    };
  }
