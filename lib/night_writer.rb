# when we run this $ ruby ./lib/night_writer.rb message.txt braille.txt
# is printed to the terminal Created 'braille.txt' containing 256 characters

handle = File.open(ARGV[0], 'r')
incoming_text = handle.read
handle.close

puts "Created 'braille.txt' containing 256 characters"

translated_file = incoming_text.gsub(/./) {|s| s.ord.to_s + ' '}
writer = File.open(ARGV[1], 'w')

writer.write(translated_file)
writer.close
