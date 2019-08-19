def welcome
  puts "HAIL BANE"
end

def get_character_from_user
  puts "please enter a character name"
  char = gets.chomp
  p char
  # use gets to capture the user's input. This method should return that input, downcased.
end
