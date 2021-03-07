require './lib/translator'

input_file = File.read(ARGV[0]).chomp.downcase

translator = Translator.new(input_file)

translation_to_braille = File.write(ARGV[1], translator.output_to_file)

puts "Created #{ARGV[1]} containing #{input_file.length} characters"
