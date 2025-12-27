{...}: {
  plugins.dap = {
    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "⊚";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
      dapStopped = {
        text = "▶";
        texthl = "DapStopped";
        linehl = "Visual";
        numhl = "DapStopped";
      };
      dapBreakpointRejected = {
        text = "⊘";
        texthl = "DapBreakpointRejected";
      };
    };
  };
}
