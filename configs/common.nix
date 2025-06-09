# This is the config file for the parts that all the hosts have in common
{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.evy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    ignoreShellProgramCheck = true;
    shell = pkgs.fish;
  };

  programs.hyprland.enable = true;

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
  ];


}
