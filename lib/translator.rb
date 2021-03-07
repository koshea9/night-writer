require_relative 'dictionary'

class Translator
  attr_reader :dictionary,
              :message

  def initialize(message)
    @dictionary = Dictionary.new
    @english_dictionary = dictionary.english_dictionary
    @message = message
  end

  def translate_english_message
    @message.chars.map do |char|
      @english_dictionary[char]
    end
  end
end
