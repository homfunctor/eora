{inputs, ...}: let
  inherit
    (inputs.nixpkgs.lib)
    concatStringsSep
    mkOption
    removeSuffix
    types
    ;
in rec {
  # mkOption utilities
  mkOpt = type: default: description:
    mkOption {
      inherit type default description;
    };
  mkOpt' = type: default: mkOpt type default null;

  mkAttrOpt = mkOpt types.attrs;
  mkAttrOpt' = mkOpt' types.attrs;

  mkBoolOpt = mkOpt types.bool;
  mkBoolOpt' = mkOpt' types.bool;

  mkIntOpt = mkOpt types.int;
  mkIntOpt' = mkOpt' types.int;

  mkListOpt = type: mkOpt (types.listOf type);

  mkStrOpt = mkOpt types.str;
  mkStrOpt' = mkOpt' types.str;

  # sops utilities
  mkSecretName = path:
    concatStringsSep "/" (
      map (
        v: removeSuffix "/" v
      )
      path
    );
  mkSecretPath = config: path: config.sops.secrets."${mkSecretName path}".path;
  mkSecretPH = config: path: config.sops.placeholder."${mkSecretName path}";
}
