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
    @braille_dictionary[@message]
    require "pry"; binding.pry
  end

  def format_braille_message
    length = @message.gsub("\n", "").length
    row_length = length / 3
    rows = @message.lines[0..(row_length - 1)]
    row1 = rows[0]
    row2 = rows[1]
    row3 = rows[2]
    to_translate = []
    until row1.empty?
    rows.each do |row|
      to_translate << row1.slice!(0..1)
      to_translate << row2.slice!(0..1)
      to_translate << row3.slice!(0..1)
      end
    end
    to_translate.join.scan(/.{6}/)
  end

  def translate_braille_message
    translated = ""
    format_braille_message.each do |character|
      translated << @braille_dictionary[character]
      end
    translated
  end
end
