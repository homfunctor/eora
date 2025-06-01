{pkgs, ...}: let
  inherit
    (pkgs)
    fetchFromGitLab
    dotnetCorePackages
    buildDotnetModule
    adwaita-icon-theme
    gtk3
    gtk4
    gtksourceview4
    wrapGAppsHook
    copyDesktopItems
    makeDesktopItem
    ;
in
  buildDotnetModule rec {
    pname = "apotheosis";
    version = "2025-4-10";

    src = fetchFromGitLab {
      owner = "noqn";
      repo = "apotheosis";
      rev = "742207393816ff8a9eacd768e1de8cb5df3589f1";
      hash = "sha256-jaaUDdeKryuhO8UvwCEiSFXS9vaEYXEn22Td0ztkZRg=";
    };

    dotnet-sdk = dotnetCorePackages.sdk_9_0;
    dotnet-runtime = dotnetCorePackages.runtime_9_0;

    nugetDeps = ./deps.json;

    projectfile = "Gui/Gui.csproj";

    preConfigure = ''
      dotnetFlags+=(
        --runtime linux-x64
      )
    '';

    buildInputs = runtimeDeps;

    makeWrapperArgs = [
      "--set GDK_BACKEND x11"
      "--set SDL_VIDEODRIVER x11"
    ];

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

    desktopItems = [
      (makeDesktopItem {
        desktopName = "Apotheosis";
        name = "Apotheosis";
        exec = "Apotheosis";
        icon = "pillars-of-eternity";
        comment = "GUI Mod Editor for Pillars of Eternity II: Deadfire";
        type = "Application";
        categories = ["Game"];
      })
    ];
  }
