local dap = require ("dap")
dap.adapters.codelldb = {
  type = "server",
  host = "127.0.0.1",
  port = 13000,
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function ()
      return vim.fn.getcwd () .. "/build/bin"
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
  },
}

dap.configurations.rust = {
  {
    type = "lldb",
    request = "launch",
    cargo = {
      args = { "test", "--no-run", "--lib" },
      env = { RUSTFLAGS = "-Clinker=ld.mold" },
      cwd = "${workspaceFolder}",
      problemMatcher = "$rustc",
      filter = {
        name = "mylib",
        kind = "lib",
      },
    },
  },
}
