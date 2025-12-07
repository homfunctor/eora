# default application settings
# designed for use with xdg mimeapps setup (set name, desktop),
# hyprpanel (icon, tooltip), and general usage (args, exe, pkg)
# args: arguments commonly used with app
# desktop: desktop file name (without extension)
# exe: executable found at pkg path
# icon: icon used for hyprpanel
# pkg: package path
# tooltip: hyprpanel tooltip. also functions as a human-readable set name
# per-user changes enforced via mkForce
# based on modules when possible
{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
in {
  home.opts.apps = rec {
    archive = {
      desktop = "org.gnome.FileRoller";
      exe = getExe archive.pkg;
      pkg = osConfig.file-roller.package;
      tooltip = "File Roller";
    };

    audio = {
      desktop = "org.strawberrymusicplayer.strawberry";
      exe = getExe audio.pkg;
      icon = "󰝚";
      pkg = pkgs.strawberry;
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
      args = "";
      desktop = "nemo";
      exe = getExe directory.pkg;
      pkg = pkgs.nemo-with-extensions;
      tooltip = "Nemo";
    };

    image = {
      desktop = "org.gnome.Loupe";
      exe = getExe image.pkg;
      pkg = pkgs.loupe;
      tooltip = "Loupe";
    };

    officeCalc = {
      desktop = "calc";
      exe = "${officeCalc.pkg}/bin/scalc";
      pkg = pkgs.libreoffice-fresh;
      tooltip = "Libre Office Calc";
    };

    officeImpress = {
      inherit (officeCalc) pkg;
      desktop = "impress";
      exe = "${officeImpress.pkg}/bin/simpress";
      tooltip = "Libre Office Impress";
    };

    officeWriter = {
      inherit (officeCalc) pkg;
      desktop = "writer";
      exe = "${officeCalc.pkg}/bin/swriter";
      tooltip = "Libre Office Writer";
    };

    pdf = {
      desktop = "sioyek";
      exe = getExe pdf.pkg;
      pkg = config.programs.sioyek.package;
      tooltip = "Sioyek";
    };

    shell = let
      capitalize = str: lib.toUpper (lib.substring 0 1 str) + lib.substring 1 (-1) str;
      shellName = osConfig.nixos.opts.shell;
    in {
      exe = getExe shell.pkg;
      pkg = config.programs."${shellName}".package;
      # assumes standard format of
      # shellIntegration.enable<ShellName>Integration = true;
      shellIntegration."enable${shell.tooltip}Integration" = true;
      tooltip = capitalize shellName;
    };

    terminal = {
      desktop = "kitty";
      exe = getExe terminal.pkg;
      icon = "";
      pkg = config.programs.kitty.package;
      tooltip = "Kitty";
    };

    # todo: fix this
    text = {
      desktop = "nvim";
      exe = getExe text.pkg;
      pkg = config.programs.nixvim.package;
      tooltip = "Neovim";
    };

    # todo: fix
    video = {
      desktop = "vlc";
      exe = getExe video.pkg;
      icon = "󰨛";
      pkg = pkgs.vlc;
      tooltip = "VLC";
    };
  };
}
