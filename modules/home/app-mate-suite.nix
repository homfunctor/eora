# just feels comfy
{pkgs, ...}: {
  home = {
    packages = with pkgs.mate; [
      atril
      caja-with-extensions
      engrampa
      eom
      mate-calc
      pluma
    ];
  };
}
