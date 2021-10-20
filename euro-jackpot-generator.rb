#!/usr/bin/env ruby

seed = ARGV.length == 1 && ARGV[0].to_i != 0 ? ARGV[0].to_i : Random.new_seed
random = Random.new(seed)

numbers = [];
extra_numbers = []

while numbers.length < 5
  got_number = false
        
  while not got_number
    random_number = random.rand(1...51)

    unless numbers.include? random_number
      got_number = true
    end
  end

  numbers << random_number
end

numbers.sort!

while extra_numbers.length < 2
  got_number = false

  while not got_number
    random_number = random.rand(1...11)

    unless extra_numbers.include? random_number
      got_number = true
    end

    extra_numbers << random_number
  end
end

extra_numbers.sort!

numbers.push(*extra_numbers)

template = '+----+----+----+----+----+
| %2d | %2d | %2d | %2d | %2d |
+----+----+----+----+----+
| %2d | %2d |
+----+----+
'

puts template % numbers

