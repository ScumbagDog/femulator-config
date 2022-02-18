{ pkgs, ... }:
{
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.opengl = {
        enable = true;
        #driSupport = true;
        #driSupport32Bit = true;
    };
    boot.kernelPackages = pkgs.linuxPackages_latest;
}
