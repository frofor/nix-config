{ user, ... }:

{
  home = {
    stateVersion = "25.11";
    username = user;
    homeDirectory = "/home/${user}";
  };
}
