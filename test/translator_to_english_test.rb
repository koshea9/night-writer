require './test/test_helper'

class TranslatorToEnglishTest < Minitest::Test

  def test_it_exists
    translator_to_english = TranslatorToEnglish.new("0.
    ..
    ..")

    assert_instance_of TranslatorToEnglish, translator_to_english
  end

  def test_it_can_translate_single_character
    translator_to_english = TranslatorToEnglish.new("0.
    ..
    ..")

    assert_equal "a", translator_to_english.translate_braille_message
  end

end
