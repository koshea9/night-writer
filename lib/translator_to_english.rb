require './lib/dictionary'

class TranslatorToEnglish
  attr_reader :message,
              :dictionary

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
    @braille_dictionary = dictionary.braille_dictionary
  end

    def translate_braille_message
      @braille_dictionary[@message.split]
    end

  def top_braille_message
    array = message.scan(/.{6}/)
    top = array [0]
  end

  def middle_braille_message
    array = message.scan(/.{6}/)
    top = array [1]
  end

  def bottom_braille_message
    array = message.scan(/.{6}/)
    top = array [2]
  end
end
