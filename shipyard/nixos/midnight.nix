#==========================#
#     UNSC-Midnightlamp    #
#  My main desktop config  #
#==========================#

{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ./networking.nix
    ./users.nix

    ./midnight-pkgs.nix
    ./midnight-hc.nix
  ];

  #  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TODO: Set your hostname
  networking.hostName = "UNSC-Midnightlamp";

  # Enable networking
  #  networking.networkmanager.enable = true;

  # Set your time zone.
  # time.timeZone = "America/New_York";

  #  # Select internationalisation properties.
  #  i18n.defaultLocale = "en_US.UTF-8";
  #
  #  i18n.extraLocaleSettings = {
  #    LC_ADDRESS = "en_US.UTF-8";
  #    LC_IDENTIFICATION = "en_US.UTF-8";
  #    LC_MEASUREMENT = "en_US.UTF-8";
  #    LC_MONETARY = "en_US.UTF-8";
  #    LC_NAME = "en_US.UTF-8";
  #    LC_NUMERIC = "en_US.UTF-8";
  #    LC_PAPER = "en_US.UTF-8";
  #    LC_TELEPHONE = "en_US.UTF-8";
  #    LC_TIME = "en_US.UTF-8";
  #  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  #  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  #  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  #  services.resolved = {
  #    enable = true;
  #    dnssec = "true";
  #    domains = [ "~." ];
  #    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
  #    dnsovertls = "true";
  #  };

  #  # Configure keymap in X11
  #  services.xserver.xkb = {
  #    layout = "us";
  #    variant = "";
  #  };
  #
  #  # Enable CUPS to print documents.
  #  services.printing.enable = true;
  #  services.deluge.enable = true;

  #  # Enable sound with pipewire.
  #  services.pulseaudio.enable = false;
  #  security.rtkit.enable = true;
  #  services.pipewire = {
  #    enable = true;
  #    alsa.enable = true;
  #    alsa.support32Bit = true;
  #    pulse.enable = true;
  #  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
