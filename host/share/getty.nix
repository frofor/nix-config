{ user }:

{
  services.getty = {
    autologinUser = user;
    autologinOnce = true;
  };
}
