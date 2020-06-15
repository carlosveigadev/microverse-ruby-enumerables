require_relative '../src/enumerables.rb'

puts '--my_each: ----------------------'
puts ''
a = %w[a b c]
a.my_each { |x| print "#{x} -- " } # a -- b -- c --

puts "\n\n\n"

puts '--my_each_with_index: -----------'
puts ''
a = %w[a b c]
a.my_each_with_index { |x, i| print "[#{x}, #{i}] -- " } # [a, 0] -- [b, 1] -- [c, 2] --

puts "\n\n\n"

puts '--my_select: --------------------'
puts ''
p(%w[a b c d e f].my_select { |v| v =~ /[aeiou]/ }) #=> ["a", "e"]

puts "\n\n\n"

puts '--my_all?: ----------------------'
puts ''

p(%w[ant bear cat].my_all? { |word| word.length >= 3 }) #=> true
p(%w[ant bear cat].my_all? { |word| word.length >= 4 }) #=> false
p %w[ant bear cat].my_all?(/t/) #=> false
p [1, 2i, 3.14].my_all?(Numeric) #=> true
p [nil, true, 99].my_all? #=> false
p [].my_all? #=> true

puts "\n\n\n"

puts '--my_any?: ----------------------'
puts ''

p(%w[ant bear cat].any? { |word| word.length >= 3 }) #=> true
p(%w[ant bear cat].any? { |word| word.length >= 4 }) #=> true
p %w[ant bear cat].any?(/d/) #=> false
p [nil, true, 99].any?(Integer) #=> true
p [nil, true, 99].any? #=> true
p [].any? #=> false

puts "\n\n\n"

puts '--my_none?: ----------------------'
puts ''

p(%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
p(%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
p(%w[ant bear cat].my_none?(/d/)) #=> true
p [1, 3.14, 42].my_none?(Float) #=> false
p [].my_none? #=> true
p [nil].my_none? #=> true
p [nil, false].my_none? #=> true
p [nil, false, true].my_none? #=> false

puts "\n\n\n"

puts '--my_count: ----------------------'
puts ''

ary = [1, 2, 4, 2]
p ary.my_count #=> 4
p ary.my_count 2 #=> 2
p(ary.my_count { |x| (x % 2).zero? }) #=> 3

puts "\n\n\n"

puts '--my_map: ------------------------'
puts ''

p((1..4).my_map { |i| i * i }) #=> [1, 4, 9, 16]

puts "\n\n\n"

puts '--my_inject: ---------------------'
puts ''

p((5..10).my_inject(:+)) #=> 45
p((5..10).my_inject { |sum, n| sum + n }) #=> 45
p((5..10).my_inject(1, :*)) #=> 151200
p((5..10).my_inject(1) { |product, n| product * n }) #=> 151200
l = %w[cat sheep bear].my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
p l #=> "sheep"

puts "\n\n\n"

puts '--multiply_els: ---------------------'
puts ''

p(multiply_els(2..4)) #=> 24
