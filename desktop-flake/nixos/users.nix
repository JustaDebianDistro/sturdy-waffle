{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
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
