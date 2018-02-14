 require 'erb'

kids_data   = File.read('data/kids-data.txt')
nice_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  toys     = kid_data_array[2..7]
  toy_rdm  = kid_data_array[2..7].sample
  toys.delete(toy_rdm)

  temp     = kid.split('|  ')
  reason   = temp[1].to_s.chomp

  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(nice_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
