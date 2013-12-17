class WordAnalysis
  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_counter
    phrase_array = @phrase.scan(/\w+/)
    @word_count = counter(phrase_array)
  end

  def symbol_counter
    symbol_array = @phrase.delete(' ').scan(/[\W_]+/)
    @symbol_count = counter(symbol_array)
  end

  def letter_counter
    letter_array = @phrase.scan(/\w/)
    @letter_count = counter(letter_array)
  end

  def top_words(amount=3)
    @word_count ||= word_counter
    get_top(@word_count, amount)
  end

  def top_letters(amount=3)
    @letter_count ||= letter_counter
    get_top(@letter_count, amount)
  end
  
  def unused_letters
    @letter_counter ||= letter_counter
    ('a'..'z').to_a - @letter_counter.keys
  end

  private

  def counter(array)
    array.inject(Hash.new(0)) {|hash, word| hash[word] += 1; hash}
  end

  def get_top(values, amount)
    Hash[values.sort_by{|k, v| v}.reverse.take(amount)]
  end
end
