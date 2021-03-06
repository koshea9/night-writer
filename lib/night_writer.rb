require './lib/english_dictionary'

input_file = File.open(ARGV[0], "r")
incoming_text = input_file.read.chomp.downcase

input_file.close
english_dictionary = EnglishDictionary.new


translation = english_dictionary.translate_message(incoming_text)
row1_count = 0
row2_count = 0
row3_count = 0

  #loop
      row1 = translation.flat_map do |braille|
        row1_count += 1
        braille[0]
      end.join(', ').gsub(",","")
      if row1_count % 40
      end

      row2 = translation.flat_map do |braille|
        row2_count += 1
        braille[1]
      end.join(', ').gsub(",","")
      if row2_count % 40
      end

      row3 = translation.flat_map do |braille|
        row3_count += 1
        braille[2]
      end.join(', ').gsub(",","")
      if row3_count % 40
    end
# loop printing row 1 2 3 until 40 characters then start new row
print_view = "#{row1[0..39]}\n#{row2[0..39]}\n#{row3[0..39]}\n#{row1[40..79]}\n#{row2[40..79]}\n#{row3[40..79]}\n#{row1[80..119]}\n#{row2[80..119]}\n#{row3[80..119]}"

writer = File.open(ARGV[1], "w")
writer.write(print_view)
writer.close

character_count = incoming_text.length
output_file = ARGV[1].to_s
puts "Created '#{output_file}' containing #{character_count} characters"
