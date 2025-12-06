{ config, ... }: let
  inherit (config.lib.nixvim) listToUnkeyedAttrs;
  layoutPreset = "function() return vim.o.columns >= 80 and 'default' or 'vertical' end";
in {
  programs.nixvim.plugins.snacks = {
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
            preset.__raw = layoutPreset;
          };
        };
      };
      layout.preset.__raw = layoutPreset;
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
}
