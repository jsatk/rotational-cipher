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
