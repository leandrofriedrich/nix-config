{ config, pkgs, inputs, ... }:

let
  selfPkgs = inputs.self.packages.${pkgs.system};
in
{
  programs = {
    steam.enable = true;
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
    droidcam
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
    tailscale
    tmate
    tmux
    unrar
    unzip
    usbutils
    v4l-utils
    zip
    zlib

    selfPkgs.mdns-scan
    selfPkgs.samfirm-js
  ];
}
