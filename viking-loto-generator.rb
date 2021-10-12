#!/usr/bin/env ruby

seed = ARGV.length == 1 && ARGV[0].to_i != 0 ? ARGV[0].to_i : Random.new_seed
random = Random.new(seed)

numbers = [];

while numbers.length < 6
  got_number = false
        
  while not got_number
    random_number = random.rand(1...49)

    unless numbers.include? random_number
      got_number = true
    end
  end

  numbers << random_number
end

numbers.sort!
numbers << random.rand(1...6)

template = '+----+----+----+----+----+----+
| %2d | %2d | %2d | %2d | %2d | %2d |
+----+----+----+----+----+----+
| %2d |
+----+
'

puts template % numbers
