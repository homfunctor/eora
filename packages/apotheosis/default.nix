{pkgs, ...}: let
  inherit
    (pkgs)
    adwaita-icon-theme
    buildDotnetModule
    copyDesktopItems
    dotnetCorePackages
    fetchFromGitLab
    gtk3
    gtk4
    gtksourceview4
    makeDesktopItem
    wrapGAppsHook
    ;

  pname = "apotheosis";
  version = "2025-4-10";
in
  buildDotnetModule rec {
    inherit pname version;

    src = fetchFromGitLab {
      hash = "sha256-jaaUDdeKryuhO8UvwCEiSFXS9vaEYXEn22Td0ztkZRg=";
      owner = "noqn";
      repo = pname;
      rev = "742207393816ff8a9eacd768e1de8cb5df3589f1";
    };

    dotnet-runtime = dotnetCorePackages.runtime_9_0;
    dotnet-sdk = dotnetCorePackages.sdk_9_0;

    nugetDeps = ./deps.json;

    projectfile = "Gui/Gui.csproj";

    buildInputs = runtimeDeps;

    nativeBuildInputs = [
      copyDesktopItems
      wrapGAppsHook
    ];

    runtimeDeps = [
      adwaita-icon-theme
      gtk3
      gtk4
      gtksourceview4
    ];

    makeWrapperArgs = [
      "--set GDK_BACKEND x11"
      "--set SDL_VIDEODRIVER x11"
    ];

    preConfigure = ''
      dotnetFlags+=(
        --runtime linux-x64
      )
    '';

    desktopItems = [
      (makeDesktopItem {
        comment = "GUI Mod Editor for Pillars of Eternity II: Deadfire";
        desktopName = "Apotheosis";
        exec = "Apotheosis";
        icon = "pillars-of-eternity";
        name = "Apotheosis";
        type = "Application";
      })
    ];
  }
