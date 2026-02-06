{ user, ... }:

{
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{
        users = [ user ];
        keepEnv = true;
        persist = true;
      }];
    };
  };
}
