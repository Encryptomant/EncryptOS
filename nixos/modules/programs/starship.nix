{
  programs.starship = {
    enable = true;

    settings = {
      format = "$username[@](bold blue)$hostname: $directory\n$character";

      character = {
        format = "$symbol ";
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
        vimcmd_symbol = "[<](bold green)";
        vimcmd_replace_one_symbol = "[<](bold purple)";
        vimcmd_replace_symbol = "[<](bold purple)";
        vimcmd_visual_symbol = "[<](bold yellow)";
      };

      directory = {
        truncation_length = 0;
        truncate_to_repo = true;
        format = "[$path]($style)[$read_only]($read_only_style)";
        style = "bold cyan";
        read_only = " {!}";
        read_only_style = "bold red";
        truncation_symbol = "";
        home_symbol = "~";
        use_os_path_sep = true;
      };

      hostname = {
        ssh_only = false;
        ssh_symbol = "SSH:";
        trim_at = "";
        format = "[$ssh_symbol$hostname]($style)";
        style = "bold blue";
      };

      username = {
        style_root = "bold red";
        style_user = "bold blue";
        format = "[$user]($style)";
        show_always = true;
      };
    };
  };
}
