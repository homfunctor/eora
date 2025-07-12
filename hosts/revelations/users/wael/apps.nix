# default application settings
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
in {
  home.opts.apps = rec {
    archive = {
      desktop = "org.gnome.FileRoller";
      exe = getExe archive.pkg;
      name = "File Roller";
      pkg = pkgs.file-roller;
    };

    audio = {
      desktop = "org.strawberrymusicplayer.strawberry";
      exe = getExe audio.pkg;
      name = "Strawberry";
      pkg = pkgs.strawberry-qt6;
    };

    browser = {
      desktop = "vivaldi-stable";
      exe = getExe browser.pkg;
      name = "Vivaldi";
      pkg = pkgs.vivaldi;
    };

    directory = {
      desktop = "org.gnome.Nautilus";
      exe = getExe directory.pkg;
      name = "Nautilus";
      pkg = pkgs.nautilus;
    };

    image = {
      desktop = "org.gnome.Loupe";
      exe = getExe image.pkg;
      name = "Loupe";
      pkg = pkgs.loupe;
    };

    launcher = {
      args = " -nofs -wm 'uwsm'";
      exe = getExe launcher.pkg;
      name = "Nwg-drawer";
      pkg = pkgs.nwg-drawer;
    };

    office = {
      desktop = "onlyoffice-desktopeditors";
      exe = getExe office.pkg;
      name = "Only Office";
      pkg = config.programs.onlyoffice.package;
    };

    pdf = {
      desktop = "org.gnome.Papers";
      exe = getExe pdf.pkg;
      name = "Papers";
      pkg = pkgs.papers;
    };

    shell = {
      exe = getExe shell.pkg;
      name = "Fish";
      pkg = config.programs.fish.package;
    };

    terminal = {
      desktop = "kitty";
      exe = getExe terminal.pkg;
      name = "Kitty";
      pkg = config.programs.kitty.package;
    };

    text = {
      desktop = "neovide";
      exe = getExe text.pkg;
      name = "Neovide";
      pkg = config.programs.neovide.package;
    };

    video = {
      desktop = "vlc";
      exe = getExe video.pkg;
      name = "VLC";
      pkg = pkgs.vlc;
    };
  };
}
