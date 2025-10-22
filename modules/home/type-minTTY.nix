# bare minimum tty environment
# simple enough to be one file
{inputs, ...}: {
  imports = [
    # not really secret but rather a prototype for how sapadal is used
    # provides: user.email, user.name
    inputs.sapadal.modules.home.app-git
  ];

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    settings = {
      color.ui = "1";
      gpg.format = "ssh";
      init.defaultBranch = "main";
      pull.rebase = "false";
    };
  };
}
