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

  services.flatpak.enable = true;

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

  services.mullvad-vpn.enable = true;


  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

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
    gnome-disk-utility
    cura-appimage
    mullvad-vpn
    wezterm
    ghostty
    distrobox
    ventoy
    gimp
    obs-studio
    freecad
    libreoffice
    cdparanoia
    picard
    vlc


    ## Dev Stuff ##
    # zig
    # SDL2

    nixfmt-classic
    nixpkgs-fmt
    nil
    zls

    ## Browser ##
    librewolf
    brave
    firefox
    mullvad-browser

    ## GAME STUFF ##
    lutris
    heroic
    mangohud
    protonup-qt
    r2modman
    vintagestory
    wine

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

    #????
    #ntfs3g
    #gst_all_1.gstreamer
    #neovim
  ];

}
