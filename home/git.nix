{
  user,
  email,
  gpgKey,
}:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        inherit email;
        name = user;
        signingkey = gpgKey;
      };
      commit.gpgSign = true;
      init.defaultBranch = "main";
      alias = {
        a = "add";
        b = "branch";
        c = "commit";
        co = "checkout";
        d = "diff";
        ds = "diff --staged";
        l = "log --oneline --graph --decorate";
        p = "push";
        r = "restore";
        rs = "restore --staged";
        s = "status";
      };
    };
  };
}
