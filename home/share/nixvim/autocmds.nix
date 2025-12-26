{
  programs.nixvim.autoCmd = [{
    event = "BufReadPost";
    callback.__raw = ''
      function()
        local line = vim.fn.line([[\"]])
        if line > 0 and line <= vim.fn.line('$') then
            vim.cmd('normal! g`"')
        end
      end
    '';
  }];
}
