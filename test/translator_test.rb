require_relative 'test_helper'

class TranslatorTest < Minitest::Test

  def test_it_exists
    translator = Translator.new("hello")

    assert_instance_of Translator, translator
  end

  def test_it_can_translate_single_letter
    translator1 = Translator.new("h")
    translator2 = Translator.new("e")

    expected1 =[["0.", "00", ".."]]
    expected2 =[["0.", ".0", ".."]]
    assert_equal expected1, translator1.translate_english_message
    assert_equal expected2, translator2.translate_english_message
  end

  def test_it_can_translate_message
    translator = Translator.new("hello")

    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."],["0.", "0.", "0."], ["0.", ".0", "0."]]
    assert_equal expected, translator.translate_english_message
  end

end
