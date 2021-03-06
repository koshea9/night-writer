require './lib/english_dictionary'

input_file = File.open(ARGV[0], "r")
incoming_text = input_file.read.chomp.downcase

input_file.close
english_dictionary = EnglishDictionary.new


translation = english_dictionary.translate_message(incoming_text)
row1_count = 0
row2_count = 0
row3_count = 0
row1_index = 0
row2_index = 1
row3_index = 2
  #loop
      row1 = translation.flat_map do |set|
        row1_count += 1
        set[row1_index]
      end.join(', ').gsub(",","")
      if row1_count % 40
        row1_index += 1
      end

      row2 = translation.flat_map do |set|
        row2_count += 1
        set[row2_index]
      end.join(', ').gsub(",","")
      if row2_count % 40
        row2_index += 1
      end

      row3 = translation.flat_map do |set|
        row3_count += 1
        set[row3_index]
      end.join(', ').gsub(",","")
      if row3_count % 40
        row3_index += 1
    end
require "pry"; binding.pry
# loop printing row 1 2 3 until 40 characters then start new row
print_view = "#{row1}\n#{row2}\n#{row3}"

writer = File.open(ARGV[1], "w")
writer.write(print_view)
writer.close

character_count = incoming_text.length
output_file = ARGV[1].to_s
puts "Created '#{output_file}' containing #{character_count} characters"
