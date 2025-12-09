 

Uses Blueprint for a simple structure with minimal boilplate. Basic idea of my flake is: modules do the work of setting up the system (/nixos) and home (/home) with data provided by /hosts/hostName and /host/hostName/users/userName. I try to strictly keep all "moving parts" in /modules. I make no claim of originality in this approach.

Features:

private flake hosted on github with secrets (with sops-nix) and things I prefer to keep private. Yes, I know you can see my github username. That one was just a proof-of-concept.

hyprland and hyprpanel, de-rounded

stylix with frostbitten base16 style inspired by the black-metal schemes (started with Immortal, I think)

gaming (steam, lutris for some non-steam things)

some goodies from chaotic nyx

lix. not that I know nix enough to know if it's worth it

disko. disko is very inscrutable. LUKS encryption.

uses a layered system. first layer is

type-minimal: bare-minimum installation for booting into after installation

type-nicerTTY: applied over the previous type layer. a nicer tty with stylix theming, neovim.

type-work: hyprland and all the stuff I need for work. aside from optional features, work laptop and work user on main pc stop here. autologins as I already enter a password to decrypt the drive. custom code i cobbled together to manually unlock gnome-keyring on autologin. logging out from hyprland leads to tuigreet. fish.

type-personal: gaming, other goodies. only for main user of personal pc.

warning: i am a mathematician. therefore i cannot program. plagiarize my plagiarism with caution.
