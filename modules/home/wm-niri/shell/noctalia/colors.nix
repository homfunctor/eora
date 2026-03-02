{
  config,
  lib,
  ...
}: {
  stylix.targets.noctalia-shell.enable = lib.mkForce false;
  programs.noctalia-shell.colors = with config.lib.stylix.colors.withHashtag; {
    mError = base08;
    mHover = base0C;
    mOnError = base00;
    mOnHover = base00;
    mOnPrimary = base00;
    mOnSecondary = base00;
    mOnSurface = base08;
    mOnSurfaceVariant = base07;
    mOnTertiary = base00;
    mOutline = base00;
    mPrimary = base0E;
    mSecondary = base0E;
    mShadow = base00;
    mSurface = base01;
    mSurfaceVariant = base00;
    mTertiary = base0C;
  };
}
