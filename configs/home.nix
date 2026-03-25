{ config, pkgs, ... }:

{
  home = {
    username = "evy";
    homeDirectory = "/home/evy";

    packages = with pkgs; [
      # Window Manager Stuffs
      #sway
      #dmenu
      #i3blocks
      #mako
      #grim
      #jq
      #libnotify
      nautilus

      # Social & Gaming
      discord
      prismlauncher
      r2modman
      steam
      heroic

      # Commandline Tools
      kakoune
      kakoune-lsp
      wget
      git
      kitty
      fastfetch
      tmux
      unzip
      tree

      # Tools
      godot

      # Media
      firefox
      feishin
      ffmpeg
      spotify
    ];

    keyboard = {
      layout = "us";
      variant = "";
    };

    file = {
      # Dotfiles
      "Sway" = {
        enable = false;
        recursive = true;
        source = ../dotfiles/sway;
				target = ".config/sway";
      };
      "Kitty" = {
        enable = true;
        recursive = true;
        source = ../dotfiles/kitty;
				target = ".config/kitty";
      };
      "Kakoune" = {
        enable = true;
        recursive = true;
        source = ../dotfiles/kak;
				target = ".config/kak";
      };
      "i3blocks" = {
        enable = false;
        recursive = true;
        source = ../dotfiles/i3blocks;
				target = ".config/i3blocks";
      };

      # Files
      "nix-init" = {
        enable = false;
        recursive = true;
        source = ../files/nix-init;
				target = "nix-init";
      };
      "Wallpapers" = {
        enable = true;
        recursive = true;
        source = ../files/Wallpapers;
				target = "Pictures/Wallpapers";
      };
    };
  };

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ls = "ls -al --color=auto";
        rebuild = "sudo nixos-rebuild switch --flake .#";
        nix-init = "~/nixos-config/files/nix-init/nix-init";
      };
    };

    git = {
      enable = true;
      settings.user = {
        name = "lyneve64";
        email = "evelynveraart@gmail.com";
      };
    };
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
