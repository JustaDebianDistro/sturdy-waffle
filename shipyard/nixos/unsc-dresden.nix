#====================#
#    UNSC-DRESDEN    #
#  my laptop config  #
#====================#
{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ./networking.nix
    ./users.nix
    ./unsc-dresden-pkgs.nix
    ./unsc-dresden-hc.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "UNSC-Dresden";
  #networking.wireless.enable = true;

  # Enable networking
  #  networking.networkmanager.enable = true;

  #  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  #  services.resolved = {
  #    enable = true;
  #    dnssec = "true";
  #    domains = [ "~." ];
  #    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
  #    dnsovertls = "true";
  #  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
