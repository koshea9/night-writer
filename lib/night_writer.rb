require './lib/english_dictionary'

input_file = File.open(ARGV[0], "r")
incoming_text = input_file.read.chomp
input_file.close
english_dictionary = EnglishDictionary.new

#need to write left to right vs. up/down
translation = english_dictionary.translate_message(incoming_text)

writer = File.open(ARGV[1], "w")
writer.write(translation)
writer.close

character_count = incoming_text.length
output_file = ARGV[1].to_s
puts "Created '#{output_file}' containing #{character_count} characters"
