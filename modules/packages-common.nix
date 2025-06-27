{ config, pkgs, inputs, ... }:

let
  selfPkgs = inputs.self.packages.${pkgs.system};
in
{
  programs = {
    git.enable = true;
    htop.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    ssh = {
      startAgent = true;
    };
  };

  environment.systemPackages = with pkgs; [
    android-tools
    autoconf
    automake
    bind
    binutils
    binwalk
    cmake
    curl
    dig
    dnsmasq
    dtc
    fastfetch
    ffmpeg
    ffmpeg
    file
    gcc
    gdb
    gnumake
    inetutils
    internetarchive
    killall
    meson
    ncdu
    ninja
    nmap
    p7zip
    pciutils
    picocom
    pkg-config
    pv
    python3
    ripgrep
    rsync
    sops
    sturmflut
    tmate
    tmux
    unrar
    unzip
    usbutils
    zip
    zlib

    selfPkgs.mdns-scan
    selfPkgs.samfirm-js
  ];
}
