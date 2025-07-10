# bare minimum tty environment
{inputs, ...}: {
  imports = [
    # not really secret but rather a prototype for how sapadal is used
    # provides: userEmail, userName
    inputs.sapadal.modules.home.app-git
  ];

  home.stateVersion = "25.05";

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      extraConfig = {
        color.ui = "1";
        gpg.format = "ssh";
        init.defaultBranch = "main";
        pull.rebase = "false";
      };
    };
  };
}
