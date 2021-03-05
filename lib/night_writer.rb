handle = File.open(ARGV[0], 'r')
incoming_text = handle.read
character_count = incoming_text.strip.length
handle.close

translated_file = incoming_text.gsub(/./) {|s| s.ord.to_s + ' '}
writer = File.open(ARGV[1], 'w')
writer_file = ARGV[1].to_s

writer.write(translated_file)
writer.close
puts "Created '#{writer_file}' containing #{character_count} characters"
