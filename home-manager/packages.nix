{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    imv
    librewolf
    mpv
    steam
    telegram-desktop
    zathura
  ];
}
