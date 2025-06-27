{ config, inputs, lib, pkgs, vars, ... }:

{
  users = {
    mutableUsers = false;
    users.leandro = {
      isNormalUser = true;
      description = "Leandro Friedrich";
      extraGroups =
        [ "wheel" ]
        ++ lib.optionals config.networking.networkmanager.enable [ "networkmanager" ]
        ++ lib.optionals config.programs.wireshark.enable [ "wireshark" ]
        ++ lib.optionals config.virtualisation.libvirtd.enable [ "libvirt" ];
      hashedPassword = "$y$j9T$V0M7qYhKW9SoL7VkD/ivR/$xnJElMHla7BQD.RJzKaQLCHddoVMdGLZDCaXYC3Bzn7";
      openssh.authorizedKeys.keys = vars.sshPubKeys;
    } // lib.optionalAttrs config.programs.zsh.enable { shell = pkgs.zsh; };
    users.root = {
      openssh.authorizedKeys.keys = vars.sshPubKeys;
    } // lib.optionalAttrs config.programs.zsh.enable { shell = pkgs.zsh; };
  };
}
