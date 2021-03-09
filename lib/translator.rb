require './lib/dictionary'
class Translator
  attr_reader :dictionary,
              :message

  def initialize(message)
    @dictionary = Dictionary.new.english_dictionary
    @message = message
    @line_break_length = 0..79
  end

  def translate_english_message
    @message.chars.map do |char|
      @dictionary[char]
    end
  end

  def output_to_file
    output = []
    row1 = braille_top
    row2 = braille_middle
    row3 = braille_bottom
    until row1.empty?
      output << row1.slice!(@line_break_length) + "\n"
      output << row2.slice!(@line_break_length) + "\n"
      output << row3.slice!(@line_break_length) + "\n"
    end
    output.join
  end

  def braille_top
    output = ""
    translate_english_message.each do |braille|
        output << braille[0]
      end
    output
  end

  def braille_middle
    output = ""
    translate_english_message.each do |braille|
        output << braille[1]
      end
    output
  end

  def braille_bottom
    output = ""
    translate_english_message.each do |braille|
        output << braille[2]
      end
    output
  end
end
