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

  def test_it_can_format_braille_message_to_match_characters
    translator_to_english = TranslatorToEnglish.new("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")

    assert_equal ["0.00..","0..0..","0.0.0.","0.0.0.","0..00.","......",".000.0","0..00.","0.000.","0.0.0.","00.0.."], translator_to_english.format_braille_message
  end

  def test_it_can_convert_multipe_braille_characters_to_english

    translator_to_english1 = TranslatorToEnglish.new("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
    translator_to_english2 = TranslatorToEnglish.new("0.0000...00....00...0..000.0..0.0.0...000.0.0..0..000..0...00....00.0..0...0.00.\n...0.0..0..0..00.0..0.0.0.00...0..00..00...0.00....0.000..00.0..0000..00..0.00..\n..0.....0.0....0....0.....0...0.000.......00..0...0.0.0...0.0....0....0...0.0...\n0000.0..0.0..0.00.0.00..0..0..0.0..0...00.0..0...0.00.0000.0..0.0.000.0.0...0..0\n.0.00...0..00000.0.0.0....0...0...00..0000..00..0.00...0.00...0..00..000.0....0.\n0...0.......0..0....0...000.....000....0....0...0.0...0...0.........0.0.....000.\n")

    assert_equal "hello world", translator_to_english1.translate_braille_message
    assert_equal "and so we lift our gazes not to what stands between us but what stands before us", translator_to_english2.translate_braille_message
  end
end
