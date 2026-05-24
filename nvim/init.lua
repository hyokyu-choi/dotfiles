require('core')

-- plugins
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

if vim.fn.isdirectory(plugins_dir) == 1 then
  for name, type in vim.fs.dir(plugins_dir) do
    if type == "file" and name:match("%.lua$") then
      local plugin_module = name:sub(1, -5)
      
      local success, err = pcall(require, "plugins." .. plugin_module)
      if not success then
        vim.notify("Error loading plugins." .. plugin_module .. ": " .. tostring(err), vim.log.levels.ERROR)
      end
    end
  end
end
