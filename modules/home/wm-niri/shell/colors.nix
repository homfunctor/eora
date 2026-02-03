# unused
{
  config,
  lib,
  ...
}: {
  stylix.targets.noctalia-shell.enable = lib.mkForce false;
  programs.noctalia-shell.colors = with config.lib.stylix.colors.withHashtag; {
    mError = base08;
    mHover = base0D;
    mOnError = base00;
    mOnHover = base00;
    mOnPrimary = base00;
    mOnSecondary = base00;
    mOnSurface = base06;
    mOnSurfaceVariant = base05;
    mOnTertiary = base00;
    mOutline = base03;
    mPrimary = base0B;
    mSecondary = base0A;
    mShadow = base00;
    mSurface = base00;
    mSurfaceVariant = base01;
    mTertiary = base0D;
  };
}
