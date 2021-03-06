require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_dictionary'

class EnglishDictionaryTest < Minitest::Test

  def test_it_exists
    english_dictionary = EnglishDictionary.new
    assert_instance_of EnglishDictionary, english_dictionary
  end

  def test_it_can_translate_single_letter
    english_dictionary = EnglishDictionary.new

    expected =[["0.", "..", ".."]]
    assert_equal expected, english_dictionary.translate_message("a")
  end

  def test_it_can_translate_message
    english_dictionary = EnglishDictionary.new

    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."],["0.", "0.", "0."], ["0.", ".0", "0."]]
    assert_equal expected, english_dictionary.translate_message("hello")
  end
end
