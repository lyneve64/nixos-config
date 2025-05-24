{
  description = "My personal config files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak,... }:
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
      ./configs/flatpak.nix

      nix-flatpak.nixosModules.nix-flatpak
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
    evy-desktop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system; };

      modules = [
      ./configs/evy-desktop/configuration.nix
      ./configs/flatpak.nix

      nix-flatpak.nixosModules.nix-flatpak
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
