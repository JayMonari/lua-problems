return function(dna)
  local translation = { G = 'C', C = 'G', T = 'A', A = 'U' }
  return dna:gsub("%a", translation)
end
