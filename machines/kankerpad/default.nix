# Lenovo ThinkPad L15

{ inputs, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../desktop.nix
  ];

  networking.hostName = "KankerPad";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = lib.mkDefault true;

  security.sudo.wheelNeedsPassword = false;
}
