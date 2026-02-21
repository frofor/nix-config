{ user, ... }:

{
  security = {
    doas = {
      enable = true;
      extraRules = [{
        users = [ user ];
        keepEnv = true;
        persist = true;
      }];
    };
    sudo.enable = false;
  };
}
