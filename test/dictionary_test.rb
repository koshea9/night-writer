require_relative 'test_helper'

class DictionaryTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new
    assert_instance_of Dictionary, dictionary
  end

  def test_it_can_lookup_english_value
    dictionary = Dictionary.new

    assert_equal ["0.", "00", ".."], dictionary.english_dictionary["h"]
  end

  def test_it_can_lookup_braille_value
    dictionary = Dictionary.new

    assert_equal "h", dictionary.braille_dictionary[["0.", "00", ".."]]
  end
end
