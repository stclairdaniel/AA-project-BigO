class String

#O(n!)
  def first_anagram?(string)
    anagrams = self.chars.permutation.map { |perm| perm.join }
    anagrams.include?(string)
  end

#O(n**n)
  def second_anagram?(string)
    dup_1, dup2 = self.dup, string.dup
    dup_1.each_char do |char|
      dup_2.each_char do |other_char|
        if char == other_char
          dup_1.sub!(char, "")
          dup_2.sub!(char, "")
        end
      end
    end
    dup_1.empty? && dup_2.empty?
  end

#
  def third_anagram?(string)
    self.chars.sort == string.chars.sort
  end

  def fourth_anagram?(string)
    freq_hash_1 = Hash.new(0)
    freq_hash_2 = Hash.new(0)
    self.each_char do |char|
      freq_hash_1[char] += 1
    end
    string.each_char do |char|
      freq_hash_2[char] += 1
    end
    freq_hash_1 == freq_hash_2
  end

  def bonus_anagram?(string)
    freq_hash = Hash.new { |hash, key| hash[key] = 0 }
    self.each_char do |char|
      freq_hash[char] += 1
    end
    string.each_char do |char|
      freq_hash[char] -= 1
    end

    freq_hash.values.all? { |value| value == 0 }
  end

end
