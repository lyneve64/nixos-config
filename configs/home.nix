{ config, pkgs, ... }:

{
  home = {
    username = "evy";
    homeDirectory = "/home/evy";

    packages = with pkgs; [
      # Hyprland
      hyprland
      foot
      wofi
      waybar
      hyprpaper
      hyprcursor
      hyprshot
      
      # Misc
      brave
      discord
      obsidian

      # Entertainment / Multimedia
      steam
      ffmpeg
      spotify-player
      atlauncher

      # Tools
      fastfetch
      nix-search-cli
      rclone
      bitwarden-cli
      bitwarden-desktop
    ];
  
    keyboard = {
      layout = "us";
      variant = "colemak_dh";
    };

    file = {
      "Hyprland" = {
        enable = true;
	recursive = true;
	source = ./files/hypr;
	target = ".config/hypr";
      };
      "Bibata Cursor" = {
        enable = true;
	recursive = true;
	source = ./files/Bibata-Original-Classic;
	target = ".icons/Bibata-Original-Classic";
      };
      "Waybar" = {
        enable = true;
	recursive = true;
	source = ./files/waybar;
	target = ".config/waybar";
      };
      "Foot" = {
        enable = true;
	recursive = true;
	source = ./files/foot;
	target = ".config/foot";
      };
    };
  };

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
      shellAliases = {
        ls = "ls -al";
	v = "nvim";
	rebuild = "sudo nixos-rebuild switch --flake .#";
      };
    };

    starship = {
      enable = true;

      settings = {
        format = ''
          [╭──╴](bold gray)$username[@](bold gray)$hostname[ ❬](bold gray)$directory[❭](bold gray)$nix_shell
          [╰╴](bold gray)
        '';

        add_newline = true;

        username = {
          show_always = true;
          style_root = "bold red";
          style_user = "bold light_gray";
          format = "[$user]($style)";
        };

        hostname = {
	  ssh_only = false;
          style = "bold light_gray";
          format = "[$hostname]($style)";
        };

        directory = {
          style = "bold light_gray";
          read_only = " [READ ONLY]";
          read_only_style = "bold red";
          format = "[$path]($style)[$read_only]($read_only_style)";
        };

        nix_shell = {
          symbol = " NIX-SHELL ";
	  style = "bold red";
          format = "[$symbol]($style)";
        };

	palette = "grays";

	palettes.grays = {
	  gray = "#555d5b";
	  light_gray = "#c5c4c4";
        };
      };
    };

    git = {
      enable = true;
      userEmail = "evelynveraart@gmail.com";
      userName = "lyneve64";

    };

  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
