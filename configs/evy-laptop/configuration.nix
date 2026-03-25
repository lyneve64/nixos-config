{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "evy-laptop"; # Define your hostname.

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [ ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  system.stateVersion = "25.11";
}

