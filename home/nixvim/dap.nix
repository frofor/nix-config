{ pkgs, ... }:

{
  programs.nixvim = {
    plugins.dap = {
      enable = true;
      adapters.executables.lldb.command = "${pkgs.lldb}/bin/lldb-dap";
      configurations.rust = [{
        name = "rust";
        type = "lldb";
        request = "launch";
        program.__raw = ''
          function()
              return vim.tbl_filter(
                  function(f) return vim.fn.executable(f) == 1 and vim.fn.isdirectory(f) == 0 end,
                  vim.fn.glob(vim.fn.getcwd() .. '/target/debug/*', false, true)
              )[1]
          end
        '';
      }];
      signs = {
        dapBreakpoint.text = "●";
        dapBreakpointCondition.text = "";
        dapLogPoint.text = "";
        dapStopped = {
          text = "";
          linehl = "Visual";
        };
        dapBreakpointRejected.text = "";
      };
    };
  };
}
