require './test/test_helper'
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

  def test_it_can_translate_multiple_letters
    translator = Translator.new("hello")

    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."],["0.", "0.", "0."], ["0.", ".0", "0."]]
    assert_equal expected, translator.translate_english_message
  end

  def test_it_can_break_up_braille_into_top_middle_bottom
    translator = Translator.new("hello")

    assert_equal "0.0.0.0.0.", translator.braille_top
    assert_equal "00.00.0..0", translator.braille_middle
    assert_equal "....0.0.0.", translator.braille_bottom
  end

  def test_it_can_format_output_to_add_line_break_at_80_braille_characters
    translator = Translator.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    expected ="0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n..\n"
    assert_equal expected, translator.output_to_file
  end
end
