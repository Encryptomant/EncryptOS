{
  networking.networkmanager = {
    enable = true;

    dns = "systemd-resolved";

    wifi = {
      backend = "iwd";
      macAddress = "random";
      scanRandMacAddress = true;
      powersave = false;
    };

    ethernet = {
      macAddress = "random";
    };
  };
}
