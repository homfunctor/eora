{inputs, ...}: {
  imports = [inputs.lix-module.nixosModules.default];

  nixpkgs.overlays = [
    (final: prev: {
      extractpdfmark = prev.extractpdfmark.overrideAttrs (oldAttrs: {
        nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [prev.gettext];
        buildInputs = (oldAttrs.buildInputs or []) ++ [prev.gettext prev.libiconv];
        preAutoreconf = ''
          mkdir -p m4
          cp -r ${prev.gettext}/share/gettext/m4/. m4/
        '';
      });
    })
  ];
}
