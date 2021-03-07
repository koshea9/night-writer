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

  def test_it_can_convert_multipe_braille_characters_to_english
    translator_to_english = TranslatorToEnglish.new("0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n")

    assert_equal "hello", translator_to_english.translate_braille_message
  end

end
