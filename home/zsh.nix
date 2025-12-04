{
  enable = true;
  defaultKeymap = "viins";
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  history.saveNoDups = true;
  initContent = ''
    if [ "$TTY" = /dev/tty1 ]; then
        exec sway
    fi
  '';
  shellAliases = {
    v = "nvim";
    g = "git";
  };
}
