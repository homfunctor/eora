{inputs, ...}: let
  inherit
    (inputs.nixpkgs.lib)
    attrNames
    concatStringsSep
    filterAttrs
    hasSuffix
    mkOption
    pipe
    removeSuffix
    types
    ;
in rec {
  # get names of all nix files in directory
  # for automating option generation
  importAllFileNames = dir:
    pipe (builtins.readDir dir) [
      (
        filterAttrs (
          name: type: type == "regular" && hasSuffix ".nix" name
        )
      )
      attrNames
      (
        map (
          name: removeSuffix ".nix" name
        )
      )
    ];

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

  # uwsm utilities
  uApp = cmd: "uwsm app -- ${cmd}";
  uTog = cmd: "pkill ${cmd} || " + (uApp cmd);
}
