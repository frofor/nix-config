{ user, email, gpgKey }:

{
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
      s = "status";
      b = "branch";
      c = "checkout";
      ci = "commit";
      d = "diff";
      ds = "diff --staged";
      l = "log --oneline --graph --decorate";
    };
  };
}
