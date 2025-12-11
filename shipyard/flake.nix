{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    #    let
    #      system = "x86_64-linux";
    #      pkgs = nixpkgs.legacyPackages.${system};
    #    in
    {
      nixosConfigurations.UNSC-Midnightlamp = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./nixos/midnightlamp.nix ];
        # inputs.home-manager.nixosModules.default ];
      };
      nixosConfigurations.UNSC-Dresden = nixpkgs.lib.nixosSystem { specialArgs = { inherit inputs; }; modules = [ ./nixos/unsc-dresden.nix ]; };
    };
}
