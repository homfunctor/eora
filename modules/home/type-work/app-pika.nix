# todo: what can be managed declaratively?
{pkgs, ...}: {
  home.packages = with pkgs; [
    pika-backup
  ];
}
