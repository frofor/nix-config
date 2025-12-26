{ config, lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  fileSystems."/" = {
    device = "/dev/mapper/luks-0c0c0553-8ae9-47ab-8a09-8cba59062a26";
    fsType = "ext4";
  };
  boot.initrd.luks.devices."luks-0c0c0553-8ae9-47ab-8a09-8cba59062a26".device =
    "/dev/disk/by-uuid/0c0c0553-8ae9-47ab-8a09-8cba59062a26";
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1561-976E";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };
  swapDevices = [{ device = "/dev/disk/by-uuid/7faa4bde-9f82-4553-83db-31323917a0fe"; }];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
