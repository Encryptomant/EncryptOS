{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    
    histSize = 10000;

    shellInit = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
        exec hyprland
      fi
    '';

    promptInit = ''
      eval "$(starship init zsh)";
    '';

    ohMyZsh = {
      enable = true;

      plugins = [
        "extract"
        "git"
        "sudo"
      ];
    };
  };
}
