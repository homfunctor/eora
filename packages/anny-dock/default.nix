{pkgs, ...}: let
  inherit
    (pkgs)
    fetchFromGitHub
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

    nativeBuildInputs = with pkgs; [
      pkg-config
    ];

    buildInputs = with pkgs; [
      alsa-lib.dev
      udev
    ];

    runtimeDeps = buildInputs;

    postPatch = ''
      ln -s ${./Cargo.lock} Cargo.lock
    '';

    meta = {
      description = "A modern, animated dock for Hyprland built with Rust and Bevy Engine. Currently exclusive to Hyprland, with plans to support other window managers in the future.";
      homepage = "https://github.com/horberlan/anny-dock";
      license = mit;
    };
  }
