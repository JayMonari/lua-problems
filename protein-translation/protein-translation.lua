local translation_table = {
  AUG	= "Methionine",
  UUU = "Phenylalanine",
  UUC	= "Phenylalanine",
  UUA = "Leucine" ,
  UUG = "Leucine",
  UCU = "Serine",
  UCC = "Serine",
  UCA = "Serine",
  UCG	= "Serine",
  UAU = "Tyrosine",
  UAC = "Tyrosine",
  UGU = "Cysteine",
  UGC	= "Cysteine",
  UGG =	"Tryptophan",
  UAA = "STOP",
  UAG = "STOP",
  UGA	= "STOP"
}

local function translate_codon(codon)
  assert(translation_table[codon] ~= nil, "Not a protein!")
  return translation_table[codon]
end

local function translate_rna_strand(rna_strand)
  local proteins = {}
  for codon in rna_strand:gmatch "..." do
    local protein = translate_codon(codon)
    if protein == "STOP" then break end

    table.insert(proteins, protein)
  end

  return proteins
end

return {
  codon = translate_codon,
  rna_strand = translate_rna_strand
}
