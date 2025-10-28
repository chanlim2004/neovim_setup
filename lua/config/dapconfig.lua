local dap = require('dap')

dap.adapters.godot = {
    type = 'server',
    host = '127.0.0.1',
    port = 6006, -- Use the port you confirmed in Godot settings
}

dap.configurations.gdscript = {
    {
        type = 'godot',
        request = 'launch',
        name = 'Launch scene',
        project = '${workspaceFolder}',
        launch_scene = true, -- Start the scene automatically
    },
}

dap.configurations.javascript = {
  {
    type = 'node',
    request = 'launch',
    name = 'Launch file (Node)',
    -- This key is crucial: it tells the debugger which script to run.
    program = '${file}', 
    cwd = '${workspaceFolder}',
    -- Use the "internalConsole" to see debugger output in the Neovim command line.
    console = 'integratedTerminal', 
    
    -- Recommended args for typical Node.js debugging
    args = {}, 
    env = {},
  },
  {
    type = 'node',
    request = 'attach',
    name = 'Attach to Running Node Process',
    processId = require('dap.utils').pick_process,
  },
}
