{ pkgs, ... }:

{
  boot = {
    kernelParams = [ "i915.enable_guc=2" ];
    kernelModules = [ "kvm-intel" "v4l2loopback" ];
    extraModulePackages = [ pkgs.linuxPackages_latest.v4l2loopback ];
    extraModprobeConfig = ''options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1 '';
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
    initrd.kernelModules = [ "i915" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/600cbe59-735c-4f31-b355-73e5d6913900";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/4AFC-5D5B";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/419f3331-ad01-4cdf-b2d2-d7d662241b4f"; }
  ];

  hardware = {
    bluetooth.enable = true;
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
    #graphics.extraPackages32 = [ pkgs.intel-media-driver-32 ];
    graphics.extraPackages32 = with pkgs.driversi686Linux; [ intel-media-driver ];
    graphics.extraPackages = [
      pkgs.intel-media-driver
      pkgs.intel-compute-runtime
      pkgs.vpl-gpu-rt
    ];
  };

  services.fstrim.enable = true;
  services.fwupd.enable = true;
  services.thermald.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
}
