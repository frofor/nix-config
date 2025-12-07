{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.saveNoDups = true;
    initContent = ''
      if [ "$TTY" = /dev/tty1 ]; then
          exec sway
      fi

      PS1='%F{red}\%f%B%F{green}%1~%f%b %B%F{red}->%f%b '
    '';
    shellAliases = {
      s = "sudo";
      v = "nvim";
      g = "git";
      c = "cargo";
    };
  };
}
