class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    #part 1
  def self.random_word
      DICTIONARY.sample
  end

  def initialize
      @secret_word = Hangman.random_word 
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
  end

  def guess_word
      @guess_word
  end
  def attempted_chars
      @attempted_chars
  end
  def remaining_incorrect_guesses
      @remaining_incorrect_guesses
  end
  def already_attempted?(char)
      if attempted_chars.include?(char)
        return true
      else
        return false
      end
  end
  def get_matching_indices(char)
      array = []
      @secret_word.each_char.with_index do |char1, idx|
        if char1 == char
          array << idx
        end
      end
      return array
  end

  def fill_indices(char, array_idx)
      @guess_word.each_with_index do |ele, i|
        if array_idx.include?(i)
          guess_word[i] = char
        end
      end
  end
  

    #PART 2
  def try_guess(char)
        if self.already_attempted?(char) == true
          p "that has already been attempted"
          return false
        end
        
        @attempted_chars << char
        matching_indices = self.get_matching_indices(char)
        if matching_indices.length == 0 
          @remaining_incorrect_guesses -= 1
        else
          self.fill_indices(char, matching_indices)
        end
      return true
  end
  def ask_user_for_guess
    p "Enter a char"
    input = gets.chomp
    self.try_guess(input)
  end
  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    end
    return false
  end
  def lose?
    if @remaining_incorrect_guesses == 0 
      p "LOSE"
      return true
    end
    return false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end
end
  
