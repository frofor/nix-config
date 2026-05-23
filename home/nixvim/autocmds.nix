{
  programs.nixvim.autoCmd = [{
    event = "BufReadPost";
    callback.__raw = ''
      function()
        local line = vim.api.nvim_buf_get_mark(0, '"')[1]
        local last_line = vim.api.nvim_buf_line_count(0)

        if line > 1 and line <= last_line then
            vim.cmd('normal! g`"')
        end
      end
    '';
  }];
}
