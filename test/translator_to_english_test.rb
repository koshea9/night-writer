require './test/test_helper'

class TranslatorToEnglishTest < Minitest::Test

  def test_it_exists
    translator_to_english = TranslatorToEnglish.new("0.\n00\n..")

    assert_instance_of TranslatorToEnglish, translator_to_english
  end

  def test_it_can_translate_single_braille_character_to_english
    translator_to_english = TranslatorToEnglish.new("0.\n00\n..")

    assert_equal "h", translator_to_english.translate_braille_message
  end

  def test_it_can_convert_input_to_top_middle_bottom
    translator_to_english = TranslatorToEnglish.new("0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n")

    assert_equal "0.0.0.", translator_to_english.top_braille_message #take 0 index
    assert_equal "00.00.", translator_to_english.middle_braille_message #take 1 index
    assert_equal "....0.", translator_to_english.bottom_braille_message# take 2 index

    # hello world this is a longer string to test "0.0.0.0.0....00.0.0.00...00..0.0...0.0..0...0.0.00000.0....0.00..00000..0.00...0\n00.00.0..0..00.0000..0..00000.0...0.0.......0..0.000.000..0.00000..000...00...00\n....0.0.0....00.0.0.....0.....0.....0.......0.0.0.....0...0.0.0...0.....0.....0.\n0.00.0\n.0..00\n..000.\n"
  end


  def test_it_can_convert_multipe_braille_characters_to_english
    translator_to_english = TranslatorToEnglish.new("0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n")

    assert_equal "hello", translator_to_english.translate_braille_message
  end

end
