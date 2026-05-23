let
  toggleBufferIndex = ''
    function()
        status = vim.fn.systemlist({ 'git', 'status', '-s', vim.fn.expand('%') })[1]:sub(2, 2)
        if status == ' ' then
            require('gitsigns').reset_buffer_index()
        else
            vim.cmd('update')
            vim.fn.system({ 'git', 'add', vim.fn.expand('%') })
        end
    end
  '';
  openDiff = ''
    function()
        require('gitsigns').diffthis()
        vim.cmd.wincmd('h')
    end
  '';
in
[
  { mode = [ "n" ]; key = "[g"; action = ":Gitsigns nav_hunk prev<cr>"; }
  { mode = [ "n" ]; key = "]g"; action = ":Gitsigns nav_hunk next<cr>"; }
  { mode = [ "n" ]; key = "<leader>go"; action = ":Gitsigns preview_hunk<cr>"; }
  { mode = [ "n" ]; key = "<leader>ga"; action = ":Gitsigns stage_hunk<cr>"; }
  { mode = [ "n" ]; key = "<leader>gA"; action.__raw = toggleBufferIndex; }
  { mode = [ "n" ]; key = "<leader>gr"; action = ":Gitsigns reset_hunk<cr>"; }
  { mode = [ "n" ]; key = "<leader>gR"; action = ":Gitsigns reset_buffer<cr>"; }
  { mode = [ "n" ]; key = "<leader>gd"; action.__raw = openDiff; }
  { mode = [ "n" ]; key = "<leader>gb"; action = ":Gitsigns blame_line<cr>"; }
  { mode = [ "n" ]; key = "<leader>gB"; action = ":Gitsigns blame<cr>"; }
]
