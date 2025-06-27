# David's NixOS configs (LEANDRO EDITION)
Configuration files for my NixOS machines.

## Desktop
Devices: KankerPad

### Installation:
1. Install NixOS and enable flakes
2. Setup age key:
    ```
    mkdir -p /var/lib/sops-nix
    sudo nix-shell -p nano --run "nano /var/lib/sops-nix/key.txt"
    chmod 400 /var/lib/sops-nix/key.txt
    ```
3. Deploy:
    ```
    nix-shell -p git --run "git clone https://github.com/leandrofriedrich/nix-config.git"
    cd nix-config
    sudo nixos-rebuild boot --flake "path:.#<HOSTNAME>"
    sudo reboot
    ```
