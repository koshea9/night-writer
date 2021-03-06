require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_dictionary'

class EnglishDictionaryTest < Minitest::Test

  def test_it_exists
    english_dictionary = EnglishDictionary.new
    assert_instance_of EnglishDictionary, english_dictionary
  end

  def test_it_can_lookup_single_letter
    english_dictionary = EnglishDictionary.new

    expected = "0.\n00\n.."
    assert_equal expected, english_dictionary.lookup('h')
  end

  def test_it_can_translate_message
    english_dictionary = EnglishDictionary.new

    expected = "0.\n00\n..0.\n.0\n..0.\n0.\n0.0.\n0.\n0.0.\n.0\n0."
    assert_equal expected, english_dictionary.translate_message("hello")
  end
end
