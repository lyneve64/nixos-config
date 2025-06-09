{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common.nix
    ];

  # IN CASE OF NVIDIA!!!
  #hardware.graphics = {
  #  enable = true;
  #  enable32Bit = true;
  #  extraPackages = with pkgs; [nvidia-vaapi-driver egl-wayland];
  #};
  #services.xserver.videoDrivers = ["nvidia"];
  #hardware.nvidia.open = false;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "HOSTNAME";

  system.stateVersion = "VERSION FROM INITIALLY GENERATED CONFIG";

}

