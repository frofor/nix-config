{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.dataHome}/zsh";
    defaultKeymap = "viins";
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    syntaxHighlighting.enable = true;
    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      append = true;
      saveNoDups = true;
    };
    initContent = ''
      [ "$TTY" = /dev/tty1 ] && exec sway >/dev/null 2>&1

      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

      _comp_options+=(globdots)
      zstyle ':completion:*' completer _complete _ignored _correct _approximate
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' menu select

      PS1="%F{yellow}[%f%F{magenta}%1~%f%F{yellow}]%f$ "

      go-back() {
          popd >/dev/null 2>&1
          zle reset-prompt
      }

      open-repo() {
          if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
              url="$(git remote get-url origin)"
              name="$(git rev-parse --show-toplevel | xargs basename)"

              ${pkgs.libnotify}/bin/notify-send "Opening $name repository..." "$url"
              xdg-open "$url"
          fi
      }

      zle -N go-back && bindkey '^o' go-back
      zle -N open-repo && bindkey '^g' open-repo
    '';
  };
}
