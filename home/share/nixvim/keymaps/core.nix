[
  { mode = [ "n" "v" ]; key = ";"; action = ":"; }
  { mode = [ "n" ]; key = "<leader>w"; action = ":update<cr>"; }
  { mode = [ "n" ]; key = "<leader>q"; action = ":quit!<cr>"; }
  { mode = [ "n" "v" ]; key = "<leader>y"; action = "\"+y"; }
  { mode = [ "n" "v" ]; key = "<leader>p"; action = "\"+p"; }
  { mode = [ "n" "v" ]; key = "<c-n>"; action = "<esc>:'<,'>norm "; }
  { mode = [ "n" "v" ]; key = "<c-s>"; action = "<esc>:'<,'>s/\\V"; }
  { mode = [ "n" ]; key = "<leader>F"; action = ":lua vim.lsp.buf.format()<cr>"; }
  { mode = [ "n" ]; key = "<leader>R"; action = ":lua vim.lsp.buf.rename()<cr>"; }
  { mode = [ "n" ]; key = "<leader>a"; action = ":lua vim.lsp.buf.code_action()<cr>"; }
  { mode = [ "n" ]; key = "<M-d>"; action = ":lua vim.diagnostic.open_float()<cr>"; }
]
