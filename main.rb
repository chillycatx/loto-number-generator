#!/usr/bin/env ruby

seed = ARGV.length == 1 && ARGV[0].to_i != 0 ? ARGV[0].to_i : Random.new_seed
random = Random.new(seed)

step = 15
current_letter = 1

hash = {
    'B': {},
    'I': {},
    'N': {},
    'G': {},
    'O': {}
}

hash.each do |letter, numbers|
    used = []

    while numbers.length < 5
        got_number = false
        
        while not got_number
            low_step = 1 + step * current_letter - step
            high_step = step * current_letter + 1

            random_number = random.rand(low_step...high_step)

            unless used.include? random_number
                got_number = true
            end
        end

        used << random_number
        hash[letter][hash[letter].length] = random_number
    end

    current_letter += 1
end

template = '+----+----+----+----+----+
|  B |  I |  N |  G |  O |
+----+----+----+----+----+
| %2d | %2d | %2d | %2d | %2d |
+----+----+----+----+----+
| %2d | %2d | %2d | %2d | %2d |
+----+----+----+----+----+
| %2d | %2d | %2d | %2d | %2d |
+----+----+----+----+----+
| %2d | %2d | %2d | %2d | %2d |
+----+----+----+----+----+
| %2d | %2d | %2d | %2d | %2d |
+----+----+----+----+----+
'

numbers = []

(0...5).each do |index|
    hash.values.each do |balls|
        numbers << balls[index]
    end
end

puts template % numbers
