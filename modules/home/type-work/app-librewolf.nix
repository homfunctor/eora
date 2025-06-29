{
  config,
  flake,
  ...
}: let
  inherit (config.home.opts) userName;
in {
  imports = [
    flake.modules.home.stylix-librewolf
  ];

  programs.librewolf = {
    enable = true;

    profiles."${userName}" = {};

    settings = {
      "browser.policies.applied" = true;

      "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
      "browser.safebrowsing.downloads.remote.block_uncommon" = false;
      "browser.safebrowsing.downloads.remote.enabled" = false;

      "browser.startup.page" = 3;

      "browser.theme.content-theme" = 0;
      "browser.theme.toolbar-theme" = 0;

      "browser.urlbar.placeholderName" = "DuckDuckGo";
      "browser.urlbar.placeholderName.private" = "DuckDuckGo";

      "browser.warnOnQuitShortcut" = false;

      "dom.forms.autocomplete.formautofill" = true;

      "network.captive-portal-service.enabled" = false;
      "network.connectivity-service.enabled" = false;
      "network.cookie.cookieBehavior.optInPartitioning" = true;
      "network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation" = true;
      "network.http.speculative-parallel-limit" = 0;
      "network.predictor.enabled" = false;
      "network.prefetch-next" = false;

      "permissions.default.geo" = 2; # Deny geolocation
      "permissions.delegation.enabled" = false;

      "privacy.annotate_channels.strict_list.enabled" = true;
      "privacy.bounceTrackingProtection.mode" = 1;
      "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;
      "privacy.clearOnShutdown_v2.cache" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "privacy.fingerprintingProtection" = true;
      "privacy.globalprivacycontrol.was_ever_enabled" = true;
      "privacy.history.custom" = true;
      "privacy.query_stripping.enabled" = true;
      "privacy.query_stripping.enabled.pbmode" = true;
      "privacy.sanitize.sanitizeOnShutdown" = false;
      "privacy.trackingprotection.emailtracking.enabled" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      "security.tls.enable_0rtt_data" = false;
    };
  };
}
