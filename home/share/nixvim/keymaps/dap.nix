let
  toggleRepl = ''
    function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
            if name:match('/%[dap%-repl%-(%d+)%]$') then
                vim.api.nvim_win_close(win, true)
                require('dap').repl.close()
                return
            end
        end

        require('dap').repl.open()
        vim.cmd('wincmd j | startinsert')
    end
  '';
in
[
  { mode = [ "n" ]; key = "<leader>ds"; action = ":DapContinue<cr>"; }
  { mode = [ "n" ]; key = "<leader>dn"; action = ":DapStepOver<cr>"; }
  { mode = [ "n" ]; key = "<leader>di"; action = ":DapStepInto<cr>"; }
  { mode = [ "n" ]; key = "<leader>do"; action = ":DapStepOut<cr>"; }
  { mode = [ "n" ]; key = "<leader>dc"; action = ":lua require('dap').run_to_cursor()<cr>"; }
  { mode = [ "n" ]; key = "<leader>db"; action = ":DapToggleBreakpoint<cr>"; }
  { mode = [ "n" ]; key = "<leader>dr"; action.__raw = toggleRepl; }
]
