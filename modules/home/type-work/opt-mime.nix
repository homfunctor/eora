{
  config,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (config.home.opts) defaultApps;
  inherit (lib) flatten mapAttrsToList nameValuePair;

  mimeMap = {
    archive = [
      "application/*tar"
      "application/7z"
      "application/rar"
      "application/zip"
    ];
    audio = [
      "audio/aac"
      "audio/mpeg"
      "audio/ogg"
      "audio/opus"
      "audio/wav"
      "audio/webm"
      "audio/x-matroska"
    ];
    browser = [
      "text/html"
      "x-scheme-handler/about"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/unknown"
    ];
    directory = ["inode/directory"];
    image = [
      "image/bmp"
      "image/gif"
      "image/jpeg"
      "image/jpg"
      "image/png"
      "image/svg+xml"
      "image/tiff"
      "image/vnd.microsoft.icon"
      "image/webp"
    ];
    office = [
      "application/msword"
      "application/rtf"
      "application/vnd.ms-excel"
      "application/vnd.ms-powerpoint"
      "application/vnd.oasis.opendocument.presentation"
      "application/vnd.oasis.opendocument.spreadsheet"
      "application/vnd.oasis.opendocument.text"
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    ];
    pdf = ["application/pdf"];
    terminal = ["terminal"];
    text = ["text/plain"];
    video = [
      "video/mp2t"
      "video/mp4"
      "video/mpeg"
      "video/ogg"
      "video/webm"
      "video/x-flv"
      "video/x-matroska"
      "video/x-msvideo"
    ];
  };

  # magick
  associations = listToAttrs (
    flatten (
      mapAttrsToList (
        key:
          map (
            type: nameValuePair type defaultApps."${key}"
          )
      )
      mimeMap
    )
  );
in {
  xdg = {
    configFile."mimeapps.list".force = true;
    mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
  };
}
