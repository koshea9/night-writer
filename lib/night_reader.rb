require './lib/translator_to_english'

input_file = File.read(ARGV[0]).chomp.downcase

translator_to_english = TranslatorToEnglish.new(input_file)

translation_to_english = File.write(ARGV[1], translator_to_english.output_to_file)

puts "Created #{ARGV[1]} containing #{input_file.length} characters"
