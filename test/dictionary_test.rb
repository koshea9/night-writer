require './test/test_helper'

class DictionaryTest < Minitest::Test
  def test_it_exists
    dictionary = Dictionary.new

    assert_instance_of Dictionary, dictionary
  end

  def test_it_swapped_braille_key_to_string
    dictionary = Dictionary.new

    assert_equal "h", dictionary.braille_dictionary["0.00.."]
  end

end
