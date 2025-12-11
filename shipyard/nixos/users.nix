{ inputs, lib, config, pkgs, ... }:

{
  users.users.rel = {
    isNormalUser = true;
    description = "Rel";
    extraGroups = [ "networkmanager" "wheel" "dialout" "adbusers" "docker" ];
    packages = with pkgs; [
      fish
      freetube
      discord
      telegram-desktop
    ];
  };

}
