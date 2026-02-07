{ pkgs, ... }:

let
  coreutilsFullName = "coreuutils-full" + builtins.concatStringsSep ""
    (builtins.genList (_: "_") (builtins.stringLength pkgs.coreutils-full.version));
  coreutilsName = "coreuutils" + builtins.concatStringsSep ""
    (builtins.genList (_: "_") (builtins.stringLength pkgs.coreutils.version));
  findutilsName = "finduutils" + builtins.concatStringsSep ""
    (builtins.genList (_: "_") (builtins.stringLength pkgs.findutils.version));
  diffutilsName = "diffuutils" + builtins.concatStringsSep ""
    (builtins.genList (_: "_") (builtins.stringLength pkgs.diffutils.version));
in
{
  system.replaceDependencies.replacements = [
    {
      oldDependency = pkgs.coreutils-full;
      newDependency = pkgs.symlinkJoin {
        name = coreutilsFullName;
        paths = [ pkgs.uutils-coreutils-noprefix ];
      };
    }
    {
      oldDependency = pkgs.coreutils;
      newDependency = pkgs.symlinkJoin {
        name = coreutilsName;
        paths = [ pkgs.uutils-coreutils-noprefix ];
      };
    }
    {
      oldDependency = pkgs.findutils;
      newDependency = pkgs.symlinkJoin {
        name = findutilsName;
        paths = [ pkgs.uutils-findutils ];
      };
    }
    {
      oldDependency = pkgs.diffutils;
      newDependency = pkgs.symlinkJoin {
        name = diffutilsName;
        paths = [ pkgs.uutils-diffutils ];
      };
    }
  ];
}
