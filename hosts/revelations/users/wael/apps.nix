# default application settings
# designed for use with xdg mimeapps setup (set name, desktop),
# hyprpanel (icon, tooltip), and general usage (args, exe, pkg)
# args: arguments commonly used with app (ex: "-w" for Nautilus)
# desktop: desktop file name (without extension)
# exe: executable found at pkg path
# icon: icon used for hyprpanel
# pkg: package path
# tooltip: hyprpanel tooltip. also functions as a human-readable set name
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
      pkg = pkgs.file-roller;
      tooltip = "File Roller";
    };

    audio = {
      desktop = "org.strawberrymusicplayer.strawberry";
      exe = getExe audio.pkg;
      icon = "󰝚";
      pkg = pkgs.strawberry-qt6;
      tooltip = "Strawberry";
    };

    browser = {
      desktop = "vivaldi-stable";
      exe = getExe browser.pkg;
      icon = "";
      pkg = pkgs.vivaldi;
      tooltip = "Vivaldi";
    };

    directory = {
      args = "-w";
      desktop = "org.gnome.Nautilus";
      exe = getExe directory.pkg;
      pkg = pkgs.nautilus;
      tooltip = "Nautilus";
    };

    image = {
      desktop = "org.gnome.Loupe";
      exe = getExe image.pkg;
      pkg = pkgs.loupe;
      tooltip = "Loupe";
    };

    launcher = {
      args = " -nofs -wm 'uwsm'";
      exe = getExe launcher.pkg;
      pkg = pkgs.nwg-drawer;
      tooltip = "Nwg-drawer";
    };

    office = {
      desktop = "onlyoffice-desktopeditors";
      exe = getExe office.pkg;
      pkg = config.programs.onlyoffice.package;
      tooltip = "Only Office";
    };

    pdf = {
      desktop = "org.gnome.Papers";
      exe = getExe pdf.pkg;
      pkg = pkgs.papers;
      tooltip = "Papers";
    };

    shell = {
      exe = getExe shell.pkg;
      pkg = config.programs.fish.package;
      tooltip = "Fish";
    };

    terminal = {
      desktop = "kitty";
      exe = getExe terminal.pkg;
      icon = "";
      pkg = config.programs.kitty.package;
      tooltip = "Kitty";
    };

    text = {
      desktop = "neovide";
      exe = getExe text.pkg;
      pkg = config.programs.neovide.package;
      tooltip = "Neovide";
    };

    video = {
      desktop = "io.github.celluloid_player.Celluloid";
      exe = getExe video.pkg;
      icon = "󰨛";
      pkg = pkgs.celluloid;
      tooltip = "celluloid";
    };
  };
}
