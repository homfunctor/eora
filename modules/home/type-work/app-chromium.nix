# todo: check if ungoogled-chromium is okay for work
{pkgs, ...}: {
  home.packages = with pkgs; [
    chromium
    # ungoogled-chromium
  ];
}
