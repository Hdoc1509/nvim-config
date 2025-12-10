return function(entry)
  -- files/folders that will always be hidden
  return entry.name ~= '.git'
end
