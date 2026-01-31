{ config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.dataHome}/zsh";
    autocd = true;
    defaultKeymap = "viins";
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      append = true;
      saveNoDups = true;
    };
    initContent = ''
      if [ "$TTY" = /dev/tty1 ]; then
          exec sway
      fi

      zstyle ':completion:*' completer _complete _ignored _correct _approximate
      zstyle ':completion:*' completions 1
      zstyle ':completion:*' file-sort name
      zstyle ':completion:*' glob 1
      zstyle ':completion:*' ignore-parents parent pwd
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*' 'r:|=**'
      zstyle ':completion:*' max-errors 2
      zstyle ':completion:*' menu select
      zstyle ':completion:*' substitute 1
    '';
    shellAliases = {
      c = "cargo";
      d = "doas ";
      g = "git";
      l = "ls -lhF --group-directories-first --color=auto";
      ls = "ls -hF --group-directories-first --color=auto";
      o = "xdg-open";
      t = "trash";
      v = "nvim";
    };
  };
}
