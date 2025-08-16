{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 0;
    rounding_power = 2;

    active_opacity = 1;
    inactive_opacity = 1;
    fullscreen_opacity = 1;

    dim_inactive = false;
    dim_strength = 0;
    dim_special = 0;
    dim_around = 0;
    
    screen_shader = "";

    border_part_of_window = true;

    blur = {
      enabled = false;

      size = 1;
      passes = 1;

      ignore_opacity = true;
      new_optimizations = true;
      
      xray = false;

      noise = 0;
      contrast = 0;
      brightness = 0;
      vibrancy = 0;
      vibrancy_darkness = 0;

      special = false;
      
      popups = false;
      popups_ignorealpha = 0;

      input_methods = false;
      input_methods_ignorealpha = 0;
    };

    shadow = {
      enabled = false;

      range = 0;
      render_power = 1;
      sharp = false;
      ignore_window = true;

      color = "rgb(137,180,250)";
      color_inactive = "rgb(108,112,134)";

      offset = "0, 0";
      
      scale = 1;
    };
  };
}
