require './lib/dictionary'

class TranslatorToEnglish
  attr_reader :message,
              :dictionary

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
    @braille_dictionary = dictionary.braille_dictionary
  end

  def translate_single_braille_character
    @braille_dictionary[@message.split]
  end

  def format_braille_message
    length = @message.gsub("\n", "").length
    row_length = length / 3
    
    row1 = 0..(row_length - 1)
    row2 = (row_length + 1)..(ro)
  require "pry"; binding.pry
    array = @message.split("\n")
    collect = []
    array.each do |line|
      collect << line[0..1]
    end
    array.each do |line|
      collect << line[2..3]
    end
    array.each do |line|
      collect << line[4..6]
    end
    collect.join.scan(/.{6}/)
    end
end
