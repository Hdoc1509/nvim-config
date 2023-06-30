-- Load plugins using io.popen() and builit-in commands
local pfile = io.popen('ls ~/.config/nvim/lua/plugins | grep -v "init" | sed -e "s/.lua//"')

if pfile ~= nil then
  for filename in pfile:lines() do
    -- print(filename)
    require('plugins.' .. filename)
  end
end
