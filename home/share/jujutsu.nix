{ user, email, gpgKey }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        inherit email;
        name = user;
      };
      signing = {
        backend = "gpg";
        key = gpgKey;
      };
    };
  };
}
