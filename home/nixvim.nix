{ config }:

let
  inherit (config.lib.nixvim) listToUnkeyedAttrs;
  leader = " ";
  defaultLayoutColumns = 80;
in
{
  enable = true;
  colorschemes.vague.enable = true;
  clipboard.register = "unnamedplus";
  globals = {
    mapleader = leader;
    maplocalleader = leader;
  };
  opts = {
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
    listchars = { space = "·"; tab = "> "; };
    ignorecase = true;
    smartcase = true;
    swapfile = false;
    undofile = true;
    winborder = "single";
  };
  keymaps = [
    { key = "<leader>w"; action = ":write<cr>"; }
    { key = "<leader>q"; action = ":quit<cr>"; }
    { key = "<leader>F"; action = ":lua vim.lsp.buf.format()<cr>"; }
    { key = "<leader>r"; action = ":lua vim.lsp.buf.rename()<cr>"; }
    { key = "<leader> "; action = ":lua Snacks.picker.resume()<cr>"; }
    { key = "<leader>/"; action = ":lua Snacks.picker.grep()<cr>"; }
    { key = "<leader>ff"; action = ":lua Snacks.picker.files()<cr>"; }
    { key = "<leader>fr"; action = ":lua Snacks.picker.recent()<cr>"; }
    { key = "<leader>e"; action = ":lua Snacks.picker.explorer()<cr>"; }
    { key = "<leader>ss"; action = ":lua Snacks.picker.lsp_symbols()<cr>"; }
    { key = "<leader>sS"; action = ":lua Snacks.picker.lsp_workspace_symbols()<cr>"; }
    { key = "gd"; action = ":lua Snacks.picker.lsp_definitions()<cr>"; }
    { key = "gD"; action = ":lua Snacks.picker.lsp_declarations()<cr>"; }
    { key = "gy"; action = ":lua Snacks.picker.lsp_type_definitions()<cr>"; }
    { key = "gr"; action = ":lua Snacks.picker.lsp_references()<cr>"; }
    { key = "gi"; action = ":lua Snacks.picker.lsp_implementations()<cr>"; }
  ];
  plugins = {
    lsp = {
      enable = true;
      servers.nixd.enable = true;
    };
    snacks = {
      enable = true;
      settings.picker = {
        matcher = {
          frecency = true;
          cwd_bonus = true;
          history_bonus = true;
        };
        icons = {
          files = {
            dir = "";
            dir_open = "";
            file = "";
          };
          git = {
            commit = "C";
            staged = "S";
            added = "A";
            deleted = "D";
            ignored = "I";
            modified = "M";
            renamed = "R";
            unmerged = "U";
            untracked = "?";
          };
        };
        sources = {
          explorer = {
            auto_close = true;
            hidden = true;
            ignored = true;
            layout = {
              preview = true;
              preset.__raw = ''
                function()
                  return vim.o.columns >= ${toString defaultLayoutColumns} and 'default' or 'vertical'
                end
              '';
            };
          };
        };
        layout.preset.__raw = ''
          function()
            return vim.o.columns >= ${toString defaultLayoutColumns} and 'default' or 'vertical'
          end
        '';
        layouts = {
          default.layout = { box = "horizontal"; } // listToUnkeyedAttrs [
            ({
              box = "vertical";
              width = 0.4;
              title = "{title} {live} {flags}";
              border = "solid";
            } // listToUnkeyedAttrs [
              { win = "input"; height = 1; }
              { win = "list"; }
            ])
            { win = "preview"; title = "{preview}"; border = "solid"; }
          ];
          vertical.layout = { box = "vertical"; } // listToUnkeyedAttrs [
            ({
              box = "vertical";
              height = 0.6;
              title = "{title} {live} {flags}";
              border = "solid";
            } // listToUnkeyedAttrs [
              { win = "input"; height = 1; }
              { win = "list"; }
            ])
            { win = "preview"; title = "{preview}"; border = "solid"; }
          ];
        };
      };
    };
  };
}
