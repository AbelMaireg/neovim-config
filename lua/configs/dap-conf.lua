local dap = require ("dap")

dap.adapters.lldb = {
    name = "lldb",
    type = "executable",
    command = "/usr/bin/lldb-dap",
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function ()
            return vim.fn.input (
                "Path to executable: ",
                vim.fn.getcwd () .. "/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.rust = {
    {
        initCommands = function ()
            local rustc_sysroot =
                vim.fn.trim (vim.fn.system ("rustc --print sysroot"))
            assert (
                vim.v.shell_error == 0,
                "failed to get rust sysroot using `rustc --print sysroot`: "
                    .. rustc_sysroot
            )
            local script_file = rustc_sysroot
                .. "/lib/rustlib/etc/lldb_lookup.py"
            local commands_file = rustc_sysroot
                .. "/lib/rustlib/etc/lldb_commands"

            return {
                ([[!command script import '%s']]):format (script_file),
                ([[command source '%s']]):format (commands_file),
            }
        end,
    },
}
