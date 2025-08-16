{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    cargo
    clang
    curl
    docker
    git
    hub
    kubectl
    neofetch
    neovim
    nodejs
    playerctl
    python3Full
    ranger
    starship
    tree
    unzip
    wget
    wofi
    yt-dlp
    zip
  ];
}
