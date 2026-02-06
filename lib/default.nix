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
    splitString
    types
    ;
in rec {
  # get names of all nix files in directory
  # for automating option generation
  importAllFileNames = dir:
    pipe (builtins.readDir dir) [
      (filterAttrs (name: type:
          type == "regular" && hasSuffix ".nix" name))
      attrNames
      (map (name: removeSuffix ".nix" name))
    ];

  # mkOption utilities
  mkOpt = type: default: description:
    mkOption {
      inherit type default description;
    };

  mkAttrOpt = mkOpt types.attrs;

  mkBoolOpt = mkOpt types.bool;

  mkFloatOpt = mkOpt types.float;

  mkIntOpt = mkOpt types.int;

  mkListOpt = type: mkOpt (types.listOf type);

  mkStrOpt = mkOpt types.str;

  # sops utilities
  mkSec = path: concatStringsSep "/" (map (v: removeSuffix "/" v) path);
  mkSecPath = config: path: config.sops.secrets."${mkSec path}".path;
  mkSecPH = config: path: config.sops.placeholder."${mkSec path}";

  # niri utilities
  splitArg = arg: splitString " " arg;
}
