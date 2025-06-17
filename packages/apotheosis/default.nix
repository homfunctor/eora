{pkgs}: let
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
    lib
    makeDesktopItem
    wrapGAppsHook
    ;
in
  buildDotnetModule rec {
    pname = "apotheosis";
    version = "2025-04-10";

    src = fetchFromGitLab {
      hash = "sha256-/d3/zraFLQkNlFAV6gNduPEz2/LAsDKQsjnP58oEaII=";
      owner = "noqn";
      repo = "apotheosis";
      rev = "b878e90d558d702afefb8be3bd9fa933ee950fb4";
    };

    dotnet-runtime = dotnetCorePackages.runtime_9_0;
    dotnet-sdk = dotnetCorePackages.sdk_9_0;
    nugetDeps = ./deps.json;

    executables = ["Apotheosis"];
    projectFile = "Gui/Gui.csproj";

    buildInputs = [
      adwaita-icon-theme
      gtk3
      gtk4
      gtksourceview4
    ];
    nativeBuildInputs = [
      copyDesktopItems
      wrapGAppsHook
    ];
    runtimeDeps = buildInputs;

    dotnetFlags = [
      "--runtime linux-x64"
    ];
    gappsWrapperArgs = [
      "--set GDK_BACKEND x11"
      "--set SDL_VIDEODRIVER x11"
    ];

    desktopItems = [
      (
        makeDesktopItem {
          categories = ["Game" "Utility"];
          comment = "GUI Mod Editor for Pillars of Eternity II: Deadfire";
          desktopName = "Apotheosis";
          exec = "Apotheosis";
          icon = "pillars-of-eternity";
          name = "Apotheosis";
          type = "Application";
        }
      )
    ];

    meta = {
      changelog = "https://gitlab.com/noqn/apotheosis/-/blob/${src.rev}/CHANGELOG.md";
      description = "";
      homepage = "https://gitlab.com/noqn/apotheosis";
      license = lib.licenses.agpl3Only;
      mainProgram = "apotheosis";
      platforms = lib.platforms.all;
    };

    doCheck = true;
    checkPhase = ''
      dotnet test --no-build --verbosity normal
    '';
  }
