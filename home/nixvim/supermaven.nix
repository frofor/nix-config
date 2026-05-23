{
  programs.nixvim.plugins.supermaven = {
    enable = true;
    settings.keymaps = {
      accept_word = "<c-,>";
      accept_suggestion = "<c-.>";
    };
  };
}
