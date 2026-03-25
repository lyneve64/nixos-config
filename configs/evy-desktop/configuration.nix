{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common.nix
    ];

	fileSystems."/home/evy/Data" = {
    device = "/dev/disk/by-label/data";
    fsType = "ext4";
    options = [
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "exec" # Permit execution of binaries and other executable files
      "X-mount.owner=evy"
    ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPatches = [
  {
    name = "amdgpu-ignore-ctx-privileges";
    patch = pkgs.fetchpatch {
      name = "cap_sys_nice_begone.patch";
      url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
      hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
    };
  }
	];

  networking.hostName = "evy-desktop"; # Define your hostname.

  programs.steam.enable = true;
  services.wivrn = {
    enable = true;
    openFirewall = true;

    defaultRuntime = true;

    autoStart = true;
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [ ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  system.stateVersion = "25.11";
}

