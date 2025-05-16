{ config, pkgs, ... }:

{
  home = {
    username = "evy";
    homeDirectory = "/home/evy";

    packages = with pkgs; [
      fastfetch
      brave
      foot
      wofi
    ];
  
    keyboard = {
      layout = "us";
      variant = "colemak_dh_iso";
    };

    file = {
      "Hyprland" = {
        enable = true;
	recursive = true;
	source = ./dotfiles/hypr;
	target = ".config/hypr";
      };
    };
  };

  programs = {
    fish.enable = true;

    starship = {
      enable = true;

      settings = {
        format = ''
          [╭──╴](bold blue)$username[@](bold blue)$hostname[ ❬](bold blue)$directory[❭](bold blue)$nix_shell
          [╰╴](bold blue)
        '';

        add_newline = true;

        username = {
          show_always = true;
          style_root = "bold red";
          style_user = "bold yellow";
          format = "[$user]($style)";
        };

        hostname = {
	  ssh_only = false;
          style = "bold yellow";
          format = "[$hostname]($style)";
        };

        directory = {
          style = "bold yellow";
          read_only = " [READ ONLY]";
          read_only_style = "bold red";
          format = "[$path]($style)[$read_only]($read_only_style)";
        };

        nix_shell = {
          symbol = " NIX-SHELL ";
	  style = "bold red";
          format = "[$symbol]($style)";
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
