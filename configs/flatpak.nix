{ lib, ... }: {

  services.flatpak.remotes = lib.mkOptionDefault [{ }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.update.onActivation = true;
  services.flatpak.uninstallUnmanaged = true;

  services.flatpak.packages = [
  ];

}
