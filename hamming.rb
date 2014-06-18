require_relative "testing_library"

def hamming(strand_1, strand_2)

strand_comparison = 0


  if (strand_1.length != strand_2.length) && (strand_1.length > strand_2.length)
    array_comparison_size = strand_2.length - 1

  elsif (strand_2.length != strand_1.length ) && (strand_2.length > strand_1.length)
    array_comparison_size = strand_1.length - 1

  else
    array_comparison_size = strand_1.length
  end

(0..array_comparison_size).each do |num|
  if strand_1[num] != strand_2[num]
    strand_comparison += 1
  end
end

strand_comparison
end

check("Hamming distance between identical strands",
      hamming("A", "A") == 0)

check("Hamming distance for single nucleotide strand",
      hamming("A", "G") == 1)

check("Hamming distance between small strands",
      hamming("AG", "CT") == 2)

check("Hamming distance between two other small strands",
      hamming("AT", "CT") == 1)

check("Hamming distance in longer strands",
      hamming("GGACG", "GGTCG") == 1)

check("Ignoring extra length in the first strand when it's longer",
      hamming("AAAG", "AAA") == 0)

check("Ignoring extra length in the second strand when it's longer",
      hamming("AAA", "AAAG") == 0)