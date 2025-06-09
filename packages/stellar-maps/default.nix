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
  version = "0.12.4";
  pname = "stellar-maps";

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

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      cp -r ${appimageContents}/usr/share/icons $out/share

      source "${dieHook}/nix-support/setup-hook"
      source "${makeWrapper}/nix-support/setup-hook"

      chmod +x $out/bin/${pname}
      mv $out/bin/${pname} $out/bin/.${pname}-wrapped
      makeWrapper  $out/bin/.${pname}-wrapped $out/bin/${pname}\
      --set GDK_BACKEND=x11 \
      --set SDL_VIDEODRIVER=x11
    '';

    meta = {
      description = "Stylized maps from Stellaris saves";
      homepage = "https://github.com/oatmealproblem/stellarmaps";
      downloadPage = "https://github.com/oatmealproblem/stellarmaps/releases";
      license = lib.licenses.mit;
    };
  }
