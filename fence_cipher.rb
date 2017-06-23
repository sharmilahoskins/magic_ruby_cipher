class RailFenceCipher
  def self.encode(text, lines)
    return '' if text == ''
    return text if lines == 1
    stripped = text.delete(' ')
    return text if stripped.length < lines

    result = make_split_strings(stripped, lines)

    result.join
  end

  def self.decode(text, lines)
    return '' if text == ''
    return text if lines == 1
    split = text.length / lines
    split_strings  = text.chars.each_slice(split).map(&:join).map(&:chars)

    output = ''
    direction = 0
    switch = 1
    text.length.times.each do |i|
      c = split_strings[direction].shift
      output << c unless c.nil?
      if direction == 0
        switch = 1
      elsif direction == lines-1
        switch = -1
      end
      direction += switch
    end
    output
  end

  def self.make_split_strings(remove_spaces, number)
    output = Array.new(number) { '' }
    direction = 0
    switch = 1
    remove_spaces.each_char do |c|
      output[direction] << c
      if direction == 0
        switch = 1
      elsif direction == number-1
        switch = -1
      end
      direction += switch
    end
    output
  end
end
