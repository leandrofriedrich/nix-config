# David's NixOS configs (LEANDRO EDITION)
Configuration files for my NixOS machines.

## Desktop
Devices: KankerPad

### Installation:
1. Put device into setup mode by wiping the PK key
2. Install NixOS and enable flakes
3. Setup age key:
    ```
    mkdir -p /var/lib/sops-nix
    sudo nix-shell -p neovim --run "nvim /var/lib/sops-nix/key.txt"
    chmod 400 /var/lib/sops-nix/key.txt
    ```
4. Generate and enroll secure boot keys:
    ```
    sudo nix-shell -p sbctl --run "sbctl create-keys"
    sudo nix-shell -p sbctl --run "sbctl enroll-keys -m"
    ```
5. Deploy:
    ```
    nix-shell -p git --run "git clone https://github.com/ungeskriptet/nix-config.git"
    cd nix-config
    sudo nixos-rebuild boot --flake "path:.#<HOSTNAME>"
    sudo reboot
    ```
