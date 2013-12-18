puts "What's your name?"
name = gets.chomp
raise NameError, "Your name should not contain numbers. Please try again." if name =~ /\d/
name_array = name.gsub(/\s/, "").downcase.split('')
an_array = ['a', 'e', 'f', 'h', 'i', 'l', 'm', 'n', 'o', 'r', 's', 'x']
name_array.each do |letter|
  diff = an_array.include?(letter) ? 'an' : 'a'
  puts "Give me " + diff + "... " + letter.capitalize
end
puts "You're the best, " + name.capitalize + '!'