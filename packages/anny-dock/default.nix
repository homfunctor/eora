{pkgs, ...}: let
  inherit
    (pkgs)
    fetchFromGitHub
    lib
    rustPlatform
    ;
  inherit (pkgs.lib.licenses) mit;
in
  rustPlatform.buildRustPackage rec {
    pname = "anny-dock";
    version = "0.0.2";

    src = fetchFromGitHub {
      owner = "horberlan";
      repo = "anny-dock";
      rev = "b51ac1abd31b6573d77ca1de38233caae13b1513";
      hash = "sha256-WsuKmVhPzNEt6Ye5oY8gKZfo1mJ4IsVwTa1cbNybd60=";
    };

    # todo: automate the lock generation
    cargoLock.lockFile = ./Cargo.lock;

    postPatch = ''
      ln -s ${./Cargo.lock} Cargo.lock
    '';

    nativeBuildInputs = with pkgs; [
      makeWrapper
      pkg-config
    ];

    buildInputs = with pkgs; [
      alsa-lib-with-plugins
      udev
      vulkan-loader
      libxkbcommon
      wayland
      xorg.libX11
      xorg.libXcursor
      xorg.libXi
      xorg.libXrandr
    ];

    postFixup = ''
      patchelf $out/bin/anny-dock \
        --add-rpath ${lib.makeLibraryPath [pkgs.vulkan-loader]}
    '';

    meta = {
      description = "A modern, animated dock for Hyprland built with Rust and Bevy Engine.";
      homepage = "https://github.com/horberlan/anny-dock";
      license = mit;
      maintainers = [];
    };
  }
