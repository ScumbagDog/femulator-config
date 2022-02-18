{ pkgs, ... }:
{
  users.users.fklub = {
    isNormalUser = true;
    extraGroups = [ "video" "audio" "input" ];
  };

  home-manager.users.fklub = {
    #xdg.configFile."retroarch/retroarch.cfg".source = ./retroarch.cfg;
  };
  
  services.xserver = {
    enable = true;
    displayManager = {
        autoLogin = {
            enable = true;
            user = "fklub";
        };
        #defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = [
        pkgs.retroarchFull
      ];
      configFile = pkgs.writeText "config" ''
        set $mod Mod4
        new_window 1pixel
        for_window [class="RetroArch"]
        exec retroarch --verbose --log-file retroarch.log
      '';
    };
  };
}
