=begin
Problem: 
- Translate the strand of RNA, or one condo to its corresponding amino acid(s)
- Stop translation if encounter UAA, UAG, UGA

of_codon data structure: 
- Given a 3 letter String (codon)
- Return a String (amino acid)

of_codon Algo:
- Create Hash to store Amino Acid as key, Array of Codon as values
- iterate through Hash, check if the values include the given codon
- if it does include the codon, return the key

of_rna data structure:
- Given multi-letter String (strand)
- Return Array of amino acids

of_rna Algo:
- Break up the strand into an Array of codons, use String#scan
- initialize an amino_acids empty array []
- Loop through the codons Array, push the matching amino acid into amino_acids Array
- Break if codon == 'STOP'
- Return amino_acids
=end
class InvalidCodonError < StandardError; end

class Translation
  def self.of_codon(letters)
    sequences = {
      'Methionine' => %w(AUG),
      'Phenylalanine' => %w(UUU UUC),
      'Leucine' => %w(UUA UUG),
      'Serine' => %w(UCU UCC UCA UCG),
      'Tyrosine' => %w(UAU UAC),
      'Cysteine' => %w(UGU UGC),
      'Tryptophan' => %w(UGG),
      'STOP' => %w(UAA UAG UGA)
    }

    sequences.each_pair do |amino_acid, codons|
      return amino_acid if codons.include?(letters) 
    end

    raise InvalidCodonError
  end

  def self.of_rna(strand)
    codons = strand.scan(/\w{3}/)
    amino_acids = []

    codons.each do |codon|
      break if self.of_codon(codon) == 'STOP'
      amino_acids << self.of_codon(codon)
    end

    amino_acids
  end
end
