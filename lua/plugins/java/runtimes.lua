-- NOTE: is this needed if we retrieve the java version from gradle.properties?
-- I'm only using java for gradle projects .-.
return vim.fn.map({ '17', '21' }, function(_, version)
  return {
    name = 'JavaSE-' .. version,
    path = vim.fn.expand('~/.sdkman/candidates/java/' .. version .. '.*-tem'),
  }
end)
