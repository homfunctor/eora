old screenshot
<img width="1680" height="1044" alt="screenshot" src="https://github.com/user-attachments/assets/24a2fde4-b5b7-4630-8f4e-a6a01d140e00" />

stylix theme
<img width="800" height="100" alt="stylix-theme-sdg" src="https://github.com/user-attachments/assets/b022f6e1-912b-4f74-845b-326d57373451" />

current minimal hyprpanel settings
<img width="1909" height="47" alt="minimalPanel" src="https://github.com/user-attachments/assets/34c68640-79be-4890-986d-d2c505156ddb" />

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

type-nicerTTY: applied over the previous type layer. a nicer tty with stylix theming, neovim, starship, fish. 

type-work: hyprland and all the stuff I need for work. aside from optional features, work laptop and work user on main pc stop here. autologins as I already enter a password to decrypt the drive. custom code i cobbled together to manually unlock gnome-keyring on autologin. logging out from hyprland leads to cosmic-greeter, which i chose because it looks nice. over-complicated code manages the backgrounds for cosmic-greeter. 

type-personal: gaming, other goodies. only for main user of personal pc.

warning: i am a mathematician. therefore i cannot program. plagiarize my plagiarism with caution.

