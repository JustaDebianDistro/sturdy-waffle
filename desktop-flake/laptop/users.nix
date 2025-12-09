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
    extraGroups = [ "networkmanager" "wheel" "dialout" "adbusers" ];
    packages = with pkgs; [
      kdePackages.kate
      fish
      freetube
      wezterm
      mullvad-vpn
      mullvad-browser
      vlc
      brave
      boxbuddy
      discord
      telegram-desktop
    ];
  };

}
