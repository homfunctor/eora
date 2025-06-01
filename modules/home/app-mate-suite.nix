# just feels comfy
# reminds me of 2006
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
