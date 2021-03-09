require './lib/dictionary'
class TranslatorToEnglish
  attr_reader :message,
              :dictionary

  def initialize(message)
    @message = message.split()
    @dictionary = Dictionary.new.braille_dictionary
  end

  def format_braille_message
    top = top_character
    middle = middle_character
    bottom = bottom_character
    full_character = [top, middle, bottom]
    format_to_translate = []
    until top.empty?
      format_to_translate << top.slice!(0..1)
      format_to_translate << middle.slice!(0..1)
      format_to_translate << bottom.slice!(0..1)
    end
    format_to_translate.join.scan(/.{6}/)
  end

  def translate_braille_message
    translated = ""
    format_braille_message.each do |character|
      translated << @dictionary[character]
    end
    translated
  end

  def top_character
    @message.find_all.each_with_index do |character, index|
      index % 3 == 0
    end.join
  end

  def middle_character
    @message.find_all.each_with_index do |character, index|
      index % 3 == 1
    end.join
  end

  def bottom_character
    @message.find_all.each_with_index do |character, index|
      index % 3 == 2
    end.join
  end
end
