require './lib/dictionary'
require './lib/translator'

input_file = File.open(ARGV[0], "r")
incoming_text = input_file.read.chomp.downcase

input_file.close
translator = Translator.new(incoming_text)

translation_to_braille = translator.output_to_file

writer = File.open(ARGV[1], "w")
writer.write(translation_to_braille)
writer.close

character_count = incoming_text.length

output_file = ARGV[1]
  puts "Created #{output_file} containing #{character_count} characters"
