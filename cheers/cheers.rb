puts "What's your name?"
name = gets.chomp
name_array = name.gsub(/\s+/, "").downcase.split('')
an_array = ['a', 'e', 'f', 'h', 'i', 'l', 'm', 'n', 'o', 'r', 's', 'x']
name_array.each do |letter|
  # an_array.include?(letter) ? diff = 'an' : diff = 'a'
  diff = an_array.include?(letter) ? 'an' : 'a'
  puts "Give me " + diff + "... " + letter.capitalize
end
puts "You're the best, " + name.capitalize + '!'