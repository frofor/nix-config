{
  services.rtorrent = {
    enable = true;
    configText = ''
      network.http.proxy_address.set = socks5h://127.0.0.1:4447
    '';
  };
}
