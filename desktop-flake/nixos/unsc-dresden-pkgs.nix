
{ inputs, lib, config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20"
    "freeimage-3.18.0-unstable-2024-04-18"
    "ventoy-1.1.07"
  ];
  
  programs.steam = {
   enable = true;
   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
 };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.cosmic.enable = true;
  programs.hyprland.enable = true;
  
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  services.mullvad-vpn.enable = true;
  services.flatpak.enable = true;
  services.deluge.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.shure-tech-mono
    nerd-fonts.departure-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    corefonts
    orbitron
    noto-fonts
    noto-fonts-color-emoji
    cascadia-code
    monaspace
  ];

  environment.systemPackages = with pkgs; [
    ## System Tools##
    home-manager
    git
    htop
    ffmpeg
    tealdeer
    fastfetch
    usbutils
    flac
    scanmem
    unzip

    emacs
    parted
    gparted
#    gnome-disk-utility
#    cura-appimage
    mullvad-vpn
    wezterm
#    ghostty
    distrobox
    ventoy
#    gimp
#    obs-studio
#    freecad
#    libreoffice
#    cdparanoia
#    picard
    vlc
    
    ## Dev Stuff ##
    # zig
    # SDL2

    nixfmt-classic
    nixpkgs-fmt
    nil
    zls
   
    ## Browser ##
    #librewolf
    brave
    firefox
    #mullvad-browser
    
    ## Hyprland things ##
    waybar
    rofi
    swaybg
    swaylock
    wl-clipboard
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    hyprsunset
    hyprpolkitagent
    kitty

    ## test things
    mpv
    cava
    pfetch
    xscreensaver
    fortune
    cmatrix
    xorg.xeyes
    conky
    lolcat
    cowsay
    nitch
    oneko
    neofetch
    glava

    #????
    #ntfs3g
  ];

}
