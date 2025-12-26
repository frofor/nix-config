{
  programs.nixvim.keymaps = [
    { mode = [ "n" "v" ]; key = ";"; action = ":"; }
    { mode = [ "n" ]; key = "<leader>w"; action = ":update<cr>"; }
    { mode = [ "n" ]; key = "<leader>q"; action = ":quit!<cr>"; }
    { mode = [ "n" "v" ]; key = "<leader>y"; action = "\"+y"; }
    { mode = [ "n" "v" ]; key = "<leader>p"; action = "\"+p"; }
    { mode = [ "n" ]; key = "<c-1>"; action = ":tabnext 1<cr>"; }
    { mode = [ "n" ]; key = "<c-2>"; action = ":tabnext 2<cr>"; }
    { mode = [ "n" ]; key = "<c-3>"; action = ":tabnext 3<cr>"; }
    { mode = [ "n" ]; key = "<c-4>"; action = ":tabnext 4<cr>"; }
    { mode = [ "n" ]; key = "<c-5>"; action = ":tabnext 5<cr>"; }
    { mode = [ "n" ]; key = "<c-6>"; action = ":tabnext 6<cr>"; }
    { mode = [ "n" ]; key = "<c-7>"; action = ":tabnext 7<cr>"; }
    { mode = [ "n" ]; key = "<c-8>"; action = ":tabnext 8<cr>"; }
    { mode = [ "n" ]; key = "<c-9>"; action = ":tabnext 9<cr>"; }
    { mode = [ "n" ]; key = "<c-tab>"; action = ":tabnext #<cr>"; }
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
    { mode = [ "n" "v" ]; key = "<c-n>"; action = "<esc>:'<,'>normal "; }
    { mode = [ "n" "v" ]; key = "<c-s>"; action = "<esc>:'<,'>substitute/\\V"; }
    { mode = [ "n" ]; key = "<c-t>"; action = ":tabnew<cr>"; }
    { mode = [ "n" ]; key = "<c-s-t>"; action = ":tabclose<cr>"; }
    { mode = [ "n" ]; key = "gd"; action = ":lua Snacks.picker.lsp_definitions()<cr>"; }
    { mode = [ "n" ]; key = "gD"; action = ":lua Snacks.picker.lsp_declarations()<cr>"; }
    { mode = [ "n" ]; key = "gy"; action = ":lua Snacks.picker.lsp_type_definitions()<cr>"; }
    { mode = [ "n" ]; key = "gr"; action = ":lua Snacks.picker.lsp_references()<cr>"; }
    { mode = [ "n" ]; key = "gi"; action = ":lua Snacks.picker.lsp_implementations()<cr>"; }
    { mode = [ "n" ]; key = "<leader>f"; action = ":lua Snacks.picker.files()<cr>"; }
    { mode = [ "n" ]; key = "<leader>r"; action = ":lua Snacks.picker.recent()<cr>"; }
    { mode = [ "n" ]; key = "<leader>b"; action = ":lua Snacks.picker.buffers()<cr>"; }
    { mode = [ "n" ]; key = "<leader>e"; action = ":lua Snacks.explorer()<cr>"; }
    { mode = [ "n" ]; key = "<leader>j"; action = ":lua Snacks.picker.jumps()<cr>"; }
    { mode = [ "n" ]; key = "<leader>m"; action = ":lua Snacks.picker.marks()<cr>"; }
    { mode = [ "n" ]; key = "<leader>d"; action = ":lua Snacks.picker.diagnostics()<cr>"; }
    { mode = [ "n" ]; key = "<leader>D"; action = ":lua Snacks.picker.diagnostics_buffer()<cr>"; }
    { mode = [ "n" ]; key = "<M-d>"; action = ":lua vim.diagnostic.open_float()<cr>"; }
    { mode = [ "n" ]; key = "<leader>a"; action = ":lua vim.lsp.buf.code_action()<cr>"; }
    { mode = [ "n" ]; key = "<leader>s"; action = ":lua Snacks.picker.lsp_symbols()<cr>"; }
    {
      mode = [ "n" ];
      key = "<leader>S";
      action = ":lua Snacks.picker.lsp_workspace_symbols()<cr>";
    }
    { mode = [ "n" ]; key = "<leader>R"; action = ":lua vim.lsp.buf.rename()<cr>"; }
    { mode = [ "n" ]; key = "<leader>F"; action = ":lua vim.lsp.buf.format()<cr>"; }
    { mode = [ "n" ]; key = "<leader> "; action = ":lua Snacks.picker.resume()<cr>"; }
    { mode = [ "n" ]; key = "<leader>/"; action = ":lua Snacks.picker.grep()<cr>"; }
    { mode = [ "n" ]; key = "<leader>H"; action = ":lua Snacks.picker.help()<cr>"; }
    { mode = [ "n" ]; key = "[h"; action = ":Gitsigns nav_hunk prev<cr>"; }
    { mode = [ "n" ]; key = "]h"; action = ":Gitsigns nav_hunk next<cr>"; }
    { mode = [ "n" ]; key = "<leader>ha"; action = ":Gitsigns stage_hunk<cr>"; }
    { mode = [ "n" ]; key = "<leader>hr"; action = ":Gitsigns reset_hunk<cr>"; }
    { mode = [ "n" ]; key = "<leader>ho"; action = ":Gitsigns preview_hunk<cr>"; }
    {
      mode = [ "n" ];
      key = "<leader>hd";
      action.__raw = ''
        function()
            require('gitsigns').diffthis()
            vim.cmd.wincmd('h')
        end
      '';
    }
    { mode = [ "n" ]; key = "<leader>hc"; action = ":Gitsigns show_commit<cr>"; }
    { mode = [ "n" ]; key = "<leader>hb"; action = ":Gitsigns blame_line<cr>"; }
    { mode = [ "n" ]; key = "<leader>hB"; action = ":Gitsigns blame<cr>"; }
    { mode = [ "n" ]; key = "<leader>Gs"; action = ":DapContinue<cr>"; }
    { mode = [ "n" ]; key = "<leader>Gn"; action = ":DapStepOver<cr>"; }
    { mode = [ "n" ]; key = "<leader>Gi"; action = ":DapStepInto<cr>"; }
    { mode = [ "n" ]; key = "<leader>Go"; action = ":DapStepOut<cr>"; }
    { mode = [ "n" ]; key = "<leader>Gc"; action = ":lua require('dap').run_to_cursor()<cr>"; }
    { mode = [ "n" ]; key = "<leader>Gb"; action = ":DapToggleBreakpoint<cr>"; }
    {
      mode = [ "n" ];
      key = "<leader>Gr";
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
