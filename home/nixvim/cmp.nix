{
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      mapping.__raw = ''
        {
            ['<c-p>'] = cmp.mapping.select_prev_item(),
            ['<c-n>'] = cmp.mapping.select_next_item(),
            ['<cr>'] = cmp.mapping.confirm({ select = true }),
            ['<esc>'] = cmp.mapping.abort(),
            ['<c-u>'] = cmp.mapping.scroll_docs(-4),
            ['<c-d>'] = cmp.mapping.scroll_docs(4),
        }
      '';
      formatting = {
        fields = [ "abbr" ];
        format = ''
          function(_, item)
              local max_len = 30
              if string.len(item.abbr) > max_len then
                  item.abbr = vim.fn.strcharpart(item.abbr, 0, max_len) .. '…'
              end
              return item
          end
        '';
      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
  };
}
