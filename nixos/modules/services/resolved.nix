{
  services.resolved = {
    enable = true;

    llmnr = "false";
    dnssec = "true";
    dnsovertls = "true";

    domains = [ "~." ];
    fallbackDns = [ "9.9.9.9" "9.9.9.10" ];
  };
}
