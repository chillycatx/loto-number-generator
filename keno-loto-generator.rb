#!/usr/bin/env ruby

fields = ARGV.length > 0 && ARGV[0].to_i != 0 ? ARGV[0].to_i : 10
seed = ARGV.length > 1 && ARGV[1].to_i != 0 ? ARGV[1].to_i : Random.new_seed
random = Random.new(seed)

numbers = [];

while numbers.length < fields
  got_number = false

  while not got_number
    random_number = random.rand(1...65)

    unless numbers.include? random_number
      got_number = true
    end
  end

  numbers << random_number
end

numbers.sort!

template = '+----' * fields << "+\n"
template << '| %2d ' * fields << "|\n"
template << '+----' * fields << "+\n"

puts template % numbers
