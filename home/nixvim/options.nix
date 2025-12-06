{
  programs.nixvim.opts = {
    mouse = "";
    expandtab = true;
    tabstop = 4;
    shiftwidth = 4;
    number = true;
    relativenumber = true;
    colorcolumn = "100";
    signcolumn = "yes";
    guicursor = "";
    list = true;
    listchars = {
      space = "·";
      tab = "> ";
    };
    ignorecase = true;
    smartcase = true;
    swapfile = false;
    undofile = true;
  };
}
