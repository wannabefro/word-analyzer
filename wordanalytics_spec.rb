require 'rspec'
require './wordanalytics'

describe WordAnalysis do
  let(:word) {WordAnalysis.new('the cow jumps, the dog jumps!')}

  it 'can count words' do
    expect(word.word_counter).to eql({'the'=> 2, 'jumps'=> 2, 'cow'=> 1, 'dog'=> 1})
  end

  it 'can count letters' do
    expect(WordAnalysis.new('hello').letter_counter).to eql({'l'=> 2, 'h'=> 1, 'o'=> 1, 'e'=> 1})
  end

  it 'can count symbols' do
    expect(word.symbol_counter).to eql({'!'=> 1, ','=> 1})
  end

  it 'can calculate unused letters' do
    expect(WordAnalysis.new('abcdefghijklmnopqrstuvwxy').unused_letters).to eql(['z'])
  end

  it 'reports the top 3 words' do
    expect(word.top_words).to eql({'the'=> 2, 'jumps'=> 2, 'cow'=> 1})
  end

  it 'reports the top 3 letters' do
    expect(WordAnalysis.new('aaaabbbccd').top_letters).to eql({'a'=> 4, 'b'=> 3, 'c'=> 2})
  end

end
