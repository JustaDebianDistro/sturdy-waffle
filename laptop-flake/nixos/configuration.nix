# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
# This is your system's configuration file.
# Use this t
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    ./users.nix
    ./pkgs.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # FIXME: Add the rest of your current configuration

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # TODO: Set your hostname
  networking.hostName = "UNSC-Dresden"; # Define your hostname.
  #networking.wireless.enable = true;

    # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

   # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    dnsovertls = "true";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

#  nixpkgs.config.permittedInsecurePackages = [
#    "dotnet-runtime-7.0.20"
#    "freeimage-3.18.0-unstable-2024-04-18"
#    "ventoy-1.1.05"
#  ];

#  services.flatpak.enable = true;
#  programs.firefox.enable = true;
#  programs.steam = {
#   enable = true;
#   remotePlay.openFirewall = true; # Open ports in the firewall for Steam# Remote Play
#   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server#
#   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
# };

#  # Enable the KDE Plasma Desktop Environment.
#  services.displayManager.sddm.enable = true;
#  services.desktopManager.plasma6.enable = true;
#  services.desktopManager.cosmic.enable = true;
#  programs.hyprland.enable = true;
#  services.mullvad-vpn.enable = true;
#

 # # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
 # users.users = {
 #   # FIXME: Replace with your username
 #   your-username = {
 #     # TODO: You can set an initial password for your user.
 #     # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
 #     # Be sure to change it (using passwd) after rebooting!
 #     initialPassword = "correcthorsebatterystaple";
 #     isNormalUser = true;
##      openssh.authorizedKeys.keys = [
 #       # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
 #     ];
 #     # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
 #     extraGroups = ["wheel"];
 #   };
 # };

#  # This setups a SSH server. Very important if you're setting up a headless system.
#  # Feel free to remove if you don't need it.
#  services.openssh = {
#    enable = true;
#    settings = {
#      # Opinionated: forbid root login through SSH.
#      PermitRootLogin = "no";
#      # Opinionated: use keys only.
#      # Remove if you want to SSH using passwords
#      PasswordAuthentication = false;
#    };
#  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
