{
  services.i2pd = {
    enable = true;
    address = "127.0.0.1";
    proto = {
      i2cp.enable = true;
      http.enable = true;
      socksProxy.enable = true;
      httpProxy.enable = true;
    };
  };
}
