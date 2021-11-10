local DNA = {}

function DNA:new(strand)
  self.nucleotideCounts = {}
  strand, self.nucleotideCounts['A'] = strand:gsub('A', '')
  strand, self.nucleotideCounts['C'] = strand:gsub('C', '')
  strand, self.nucleotideCounts['G'] = strand:gsub('G', '')
  strand, self.nucleotideCounts['T'] = strand:gsub('T', '')
  assert(#strand == 0, "Invalid Nucleotide")

  return self
end

function DNA:count(n)
  assert(self.nucleotideCounts[n] ~= nil, "Invalid Nucleotide")
  return self.nucleotideCounts[n]
end

return DNA
