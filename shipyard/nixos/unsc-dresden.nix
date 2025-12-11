#====================#
#    UNSC-DRESDEN    #
#  my laptop config  #
#====================#
{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ./users.nix
    ./unsc-dresden-pkgs.nix
    ./unsc-dresden-hc.nix
  ];

  #  nix =
  #    let
  #      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  #    in
  #    {
  #      settings = {
  #        # Enable flakes and new 'nix' command
  #        experimental-features = "nix-command flakes";
  #        # Opinionated: disable global registry
  #        flake-registry = "";
  #        # Workaround for https://github.com/NixOS/nix/issues/9574
  #        nix-path = config.nix.nixPath;
  #      };
  #      # Opinionated: disable channels
  #      channel.enable = false;
  #
  #      # Opinionated: make flake registry and nix path match flake inpu#ts
  #      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInpu#ts;
  #      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  #    };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "UNSC-Dresden";
  #networking.wireless.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  #  time.timeZone = "America/New_York";

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

  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    dnsovertls = "true";
  };

  # Configure keymap in X11
  #  services.xserver.xkb = {
  #    layout = "us";
  #    variant = "";
  #  };

  #  # Enable CUPS to print documents.
  #  services.printing.enable = true;

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
  system.stateVersion = "24.05";
}
