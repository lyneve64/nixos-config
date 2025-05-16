{
  description = "My personal config files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in
  {

  nixosConfigurations = {
    evy-laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system; };

      modules = [
      ./configs/evy-laptop/configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
	  useUserPackages = true;
	  # backupFileExtension = "backup";

	  users.evy = import ./configs/home.nix;
        };
      }
      ];
    };
  };

  homeConfigurations = {
    "evy" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };

      modules = [
        ./configs/home.nix
      ];
    };
  };
  };
}
