# todo: finish this. doesn't work yet.
# StellarMaps_0.12.4_Linux.AppImage
{pkgs, ...}: let
  inherit
    (pkgs)
    appimageTools
    dieHook
    fetchurl
    lib
    makeWrapper
    ;

  pname = "stellar-maps";
  version = "0.12.4";

  src = fetchurl {
    url = "https://github.com/oatmealproblem/stellarmaps/releases/download/stellarmaps-v${version}/StellarMaps_${version}_Linux.AppImage";
    hash = "sha256-5PdxPPxC5PMFsuEiwrV0fSzhFCR4O2TTfqdrcrkQT+U=";
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
      homepage = "https://github.com/oatmealproblem/stellarmaps";
      downloadPage = "https://github.com/oatmealproblem/stellarmaps/releases";
      license = lib.licenses.mit;
    };
  }
