module RandomData
  
  def random_paragraph
    sentences = []
    rand(4..6).times { sentences << random_sentence }
    sentences.join(" ")
  end
  
  def random_sentence
    strings = []
    rand(3..8).times { strings << random_word }
    sentence = strings.join(" ")
    sentence.capitalize << "."
  end
  
  def random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end