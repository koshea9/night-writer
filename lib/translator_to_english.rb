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
      @braille_dictionary[message.split]
  end
end
