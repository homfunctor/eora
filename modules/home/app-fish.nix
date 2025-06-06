# todo: starship
{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.hm.dag) entryAfter;
in {
  # gross
  home.activation.configure-tide =
    entryAfter ["writeBoundary"]
    ''
      ${pkgs.fish}/bin/fish -c "tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time='12-hour format' --rainbow_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_spacing=Compact --icons='Many icons' --transient=No"
    '';
}
