# A rotational cipher, ROT(X), is an ancient encoding that, given a message, returns a message where each letter has
# been replaced by the letter exactly X letters after it in the alphabet ordering. Letters near the end of the
# alphabet wrap around. For example, the translation table for ROT(13) looks like:
#
# ABCDEFGHIJKLMNOPQRSTUVWXYZ
# NOPQRSTUVWXYZABCDEFGHIJKLM
# and therefore the message HELLO becomes URYYB
#
# Please implement rotx in Ruby, which given a rotation number and a string, outputs the string rotated by that many
# letters. It should preserve capitalization and ignore any non-alphabetic character. It should also take a parameter
# that decrypts the string instead of encrypting it. For example:
#
# def rotx(x, string, encrypt=true)
#   # Your implementation here...
# end
#
# rotx 10, 'Hello, World'
# # => "Rovvy, Gybvn"
# rotx 10, 'Rovvy, Gybvn', false
# # => "Hello, World"
#
# # Rotation numbers greater than 26 should work as well
# rotx 36, 'Hello, World'
# # => "Rovvy, Gybvn"

def rotx(offset, string, encrypt=true)
  alphabet  = [*65..90, *97..122].map(&:chr).join
  encrypt   = encrypt ? 1 : -1

  string.chars.map do |char|
    position = alphabet.index(char)

    if position
      lower_case_offset = position > 25 ? 26 : 0
      index             = ((position + offset * encrypt) % 26) + lower_case_offset
      alphabet[index]
    else
      char
    end
  end.join
end

# Code to test with.

puts rotx 10, 'Hello, World'
# => "Rovvy, Gybvn"
puts rotx 10, 'Rovvy, Gybvn', false
# => "Hello, World"

# Rotation numbers greater than 26 should work as well
puts rotx 36, 'Hello, World'
# => "Rovvy, Gybvn"
puts rotx 36, 'Rovvy, Gybvn', false
