{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

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

  networking.hostName = "evy-desktop"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General.Experimental = true;
    };
  };

  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true;
  };

  # Enable graphics drivers.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # GUI tool to manage GPU.
  services.lact.enable = true;

  # Enable the X11 windowing system and set keyboard options.
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "ctrl:nocaps";
    };
  };

  # Enable the display manager and window manager. (Ly & Sway)
  services.displayManager.ly.enable = true;
  programs.sway.enable = true;

  # Enable drivers for my drawing tablet.
  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.evy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  programs.steam.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Sway-related
    dmenu
    i3blocks
    mako
    grim
    jq
    libnotify

    # Social & Gaming
    discord
    prismlauncher
    r2modman

    # Commandline Tools
    kakoune
    kakoune-lsp
    wget
    git
    kitty
    fastfetch
    tmux

    # Media
    firefox
    feishin
    ffmpeg
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  system.stateVersion = "25.11";
}

