{
  programs.nixvim.keymaps = [
    { mode = [ "n" "v" "x" ]; key = ";"; action = ":"; }
    { mode = [ "n" ]; key = "<leader>w"; action = ":update<cr>"; }
    { mode = [ "n" ]; key = "<leader>x"; action = ":quitall!<cr>"; }
    { mode = [ "n" ]; key = "<c-1>"; action = ":buffer 1<cr>"; }
    { mode = [ "n" ]; key = "<c-2>"; action = ":buffer 2<cr>"; }
    { mode = [ "n" ]; key = "<c-3>"; action = ":buffer 3<cr>"; }
    { mode = [ "n" ]; key = "<c-4>"; action = ":buffer 4<cr>"; }
    { mode = [ "n" ]; key = "<c-5>"; action = ":buffer 5<cr>"; }
    { mode = [ "n" ]; key = "<c-6>"; action = ":buffer 6<cr>"; }
    { mode = [ "n" ]; key = "<c-7>"; action = ":buffer 7<cr>"; }
    { mode = [ "n" ]; key = "<c-8>"; action = ":buffer 8<cr>"; }
    { mode = [ "n" ]; key = "<c-9>"; action = ":buffer 9<cr>"; }
    { mode = [ "n" ]; key = "<c-tab>"; action = ":buffer #<cr>"; }
    { mode = [ "n" ]; key = "<c-cr>"; action = ":vsplit | wincmd l<cr>"; }
    { mode = [ "n" ]; key = "<c-s-cr>"; action = ":split | wincmd j<cr>"; }
    { mode = [ "c" ]; key = "<c-h>"; action = "<left>"; }
    { mode = [ "c" ]; key = "<c-j>"; action = "<down>"; }
    { mode = [ "c" ]; key = "<c-k>"; action = "<up>"; }
    { mode = [ "c" ]; key = "<c-l>"; action = "<right>"; }
    { mode = [ "n" ]; key = "<c-h>"; action = ":wincmd h<cr>"; }
    { mode = [ "n" ]; key = "<c-j>"; action = ":wincmd j<cr>"; }
    { mode = [ "n" ]; key = "<c-k>"; action = ":wincmd k<cr>"; }
    { mode = [ "n" ]; key = "<c-l>"; action = ":wincmd l<cr>"; }
    { mode = [ "n" ]; key = "<c-s-h>"; action = ":vertical resize -5<cr>"; }
    { mode = [ "n" ]; key = "<c-s-j>"; action = ":resize +2<cr>"; }
    { mode = [ "n" ]; key = "<c-s-k>"; action = ":resize -2<cr>"; }
    { mode = [ "n" ]; key = "<c-s-l>"; action = ":vertical resize +5<cr>"; }
    { mode = [ "n" "x" ]; key = "<c-n>"; action = "<esc>:'<,'>normal "; }
    { mode = [ "n" "x" ]; key = "<c-s>"; action = "<esc>:'<,'>substitute/\\V"; }
    { mode = [ "n" ]; key = "<leader>F"; action = ":lua vim.lsp.buf.format()<cr>"; }
    { mode = [ "n" ]; key = "<leader>R"; action = ":lua vim.lsp.buf.rename()<cr>"; }
    { mode = [ "n" ]; key = "<leader> "; action = ":lua Snacks.picker.resume()<cr>"; }
    { mode = [ "n" ]; key = "<leader>/"; action = ":lua Snacks.picker.grep()<cr>"; }
    { mode = [ "n" ]; key = "<leader>f"; action = ":lua Snacks.picker.files()<cr>"; }
    {
      mode = [ "n" ];
      key = "<leader>c";
      action = ":lua Snacks.picker.files({ cwd = \"~/nix-config\" })<cr>";
    }
    { mode = [ "n" ]; key = "<leader>r"; action = ":lua Snacks.picker.recent()<cr>"; }
    { mode = [ "n" ]; key = "<leader>b"; action = ":lua Snacks.picker.buffers()<cr>"; }
    { mode = [ "n" ]; key = "<leader>e"; action = ":lua Snacks.explorer()<cr>"; }
    { mode = [ "n" ]; key = "<leader>h"; action = ":lua Snacks.picker.help()<cr>"; }
    { mode = [ "n" ]; key = "gd"; action = ":lua Snacks.picker.lsp_definitions()<cr>"; }
    { mode = [ "n" ]; key = "gD"; action = ":lua Snacks.picker.lsp_declarations()<cr>"; }
    { mode = [ "n" ]; key = "gy"; action = ":lua Snacks.picker.lsp_type_definitions()<cr>"; }
    { mode = [ "n" ]; key = "gr"; action = ":lua Snacks.picker.lsp_references()<cr>"; }
    { mode = [ "n" ]; key = "gi"; action = ":lua Snacks.picker.lsp_implementations()<cr>"; }
    { mode = [ "n" ]; key = "gs"; action = ":lua Snacks.picker.lsp_symbols()<cr>"; }
    { mode = [ "n" ]; key = "gS"; action = ":lua Snacks.picker.lsp_workspace_symbols()<cr>"; }
    { mode = [ "n" ]; key = "<leader>db"; action = ":DapToggleBreakpoint<cr>"; }
    { mode = [ "n" ]; key = "<leader>ds"; action = ":DapContinue<cr>"; }
    { mode = [ "n" ]; key = "<leader>dn"; action = ":DapStepOver<cr>"; }
    { mode = [ "n" ]; key = "<leader>di"; action = ":DapStepInto<cr>"; }
    { mode = [ "n" ]; key = "<leader>dI"; action = ":DapStepOut<cr>"; }
    { mode = [ "n" ]; key = "<leader>dc"; action = ":lua require('dap').run_to_cursor()<cr>"; }
    {
      mode = [ "n" ];
      key = "<leader>dr";
      action.__raw = ''
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
    }
  ];
}
