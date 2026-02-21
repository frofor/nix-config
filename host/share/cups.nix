{
  services.printing = {
    enable = true;
    webInterface = false;
    listenAddresses = [ ];
  };
  hardware.printers.ensureDefaultPrinter = "brother";
}
