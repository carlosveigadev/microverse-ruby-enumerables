module Enumerable
  def my_each
    return enum_for(__method__) unless block_given?

    size.times { |i| yield self[i] }
  end

  def my_each_with_index
    return enum_for(__method__) unless block_given?

    size.times { |i| yield(self[i], i) }
  end

  def my_select
    return enum_for(__method__) unless block_given?

    res = []
    my_each { |x| res << x if yield x }
    res
  end
end
