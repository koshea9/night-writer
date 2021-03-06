require './lib/english_dictionary'

input_file = File.open(ARGV[0], "r")
incoming_text = input_file.read.chomp.downcase

input_file.close
english_dictionary = EnglishDictionary.new

#need to write left to right vs. up/down
translation = english_dictionary.translate_message(incoming_text)
row1 = translation.flat_map do |set|
  set[0]
end.join(', ').gsub(",","")
row2 = translation.flat_map do |set|
  set[1]
end.join(', ').gsub(",","")
row3 = translation.flat_map do |set|
  set[2]
end.join(', ').gsub(",","")

print_view = "#{row1}\n#{row2}\n#{row3}"
writer = File.open(ARGV[1], "w")
writer.write(print_view)
writer.close

character_count = incoming_text.length
output_file = ARGV[1].to_s
puts "Created '#{output_file}' containing #{character_count} characters"
