 Screenshot: December 8, 2025
 
 <img width="1914" height="1070" alt="screenshot" src="https://github.com/user-attachments/assets/d27549fa-b70f-4db3-b6bd-957b9eaa1a21" />

stylix theme

<img width="800" height="100" alt="stylix-theme-sdg" src="https://github.com/user-attachments/assets/75266fc8-6038-4c8d-bd47-7998ecb4e632" />

Uses Blueprint for a simple structure with minimal boilplate. Basic idea of my flake is: modules do the work of setting up the system (/nixos) and home (/home) with data provided by /hosts/hostName and /host/hostName/users/userName. I try to strictly keep all "moving parts" in /modules. I make no claim of originality in this approach.

Features:

private flake hosted on github with secrets (with sops-nix) and things I prefer to keep private. Yes, I know you can see my github username. That one was just a proof-of-concept.

niri and minimal noctalia-shell, de-rounded

stylix with frostbitten base16 style inspired by the black-metal schemes (started with Immortal, I think)

gaming (steam, lutris for some non-steam things)

some goodies from chaotic nyx

lix. not that I know nix enough to know if it's worth it

disko. disko is very inscrutable. LUKS encryption.

uses a layered system. first layer is

type-minimal: bare-minimum installation for booting into after installation

type-nicerTTY: applied over the previous type layer. a nicer tty with stylix theming, neovim.

type-work: wm and all the stuff I need for work. aside from optional features, work laptop and work user on main pc stop here. autologins as I already enter a password to decrypt the drive. i gave up on greetd/tuigreet unlocking the keyring so gdm is the display manager (only seen on logout).

type-personal: gaming, other goodies. only for main user of personal pc.

a few settings are handled in individual modules in modules/nixos or modules/home

Also, I really like the ability to directly reference exact paths through lib.getExe and ${} references. So I do that whenever I can. It's what led me to use the centralized opts.apps stuff. This isn't really necessary since NixOS and Home Manager automagically handle things, as far as I know. But I just like the certainty implied by a config file showing /nix/store/etc-kitty-etc/bin/kitty to just relying on "kitty". It's comfy.

warning: i am a mathematician. therefore i cannot program. plagiarize my plagiarism with caution.
