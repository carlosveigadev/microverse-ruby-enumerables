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

  def my_all?(fun = nil)
    if fun
      puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if block_given?
      return my_all_handle_func(fun)
    elsif block_given?
      my_each { |x| return false unless yield x }
    else
      my_each { |x| return false unless x }
    end
    true
  end

  private

  def my_all_handle_func(fun)
    if fun.is_a?(Regexp)
      my_each { |x| return false unless fun.match? x.to_s }
    else
      my_each { |x| return false unless fun === x }
    end
    true
  end
end
