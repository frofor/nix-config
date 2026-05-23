let
  pickWorkspaceSymbol = ":lua Snacks.picker.lsp_workspace_symbols()<cr>";
in
[
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
  { mode = [ "n" ]; key = "<leader>s"; action = ":lua Snacks.picker.lsp_symbols()<cr>"; }
  { mode = [ "n" ]; key = "<leader>S"; action = pickWorkspaceSymbol; }
  { mode = [ "n" ]; key = "<leader> "; action = ":lua Snacks.picker.resume()<cr>"; }
  { mode = [ "n" ]; key = "<leader>/"; action = ":lua Snacks.picker.grep()<cr>"; }
  { mode = [ "n" ]; key = "<leader>h"; action = ":lua Snacks.picker.help()<cr>"; }
]
