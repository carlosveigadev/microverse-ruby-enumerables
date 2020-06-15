# rubocop: disable Metrics/ModuleLength
module Enumerable
  def my_each
    return enum_for(__method__) unless block_given?

    size.times { |i| yield to_a[i] }
    self
  end

  def my_each_with_index
    return enum_for(__method__) unless block_given?

    size.times { |i| yield(to_a[i], i) }
    self
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

  def my_any?(fun = nil)
    if fun
      puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if block_given?
      return my_any_handle_func(fun)
    elsif block_given?
      my_each { |x| return true if yield x }
    else
      my_each { |x| return true if x }
    end
    false
  end

  def my_none?(fun = nil)
    if fun
      puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if block_given?
      !my_any?(fun)
    elsif block_given?
      !my_any?(&Proc.new)
    else
      !my_any?
    end
  end

  def my_count(arg = nil)
    if arg
      puts "#{__FILE__}:#{__LINE__}: warning: given block not used" if block_given?
      select { |x| x == arg }.length
    elsif block_given?
      select(&Proc.new).length
    else
      to_a.length
    end
  end

  def my_map(fun = nil)
    return enum_for(__method__) unless block_given? || fun

    result = []
    if fun
      each { |x| result << (fun.yield x) }
    else
      each { |x| result << (yield x) }
    end
    result
  end

  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def my_inject(arg1 = nil, arg2 = nil, &block)
    # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    fun = nil
    if arg1.is_a?(Symbol)
      fun = arg1
    elsif arg2.is_a?(Symbol)
      fun = arg2
    end
    raise LocalJumpError.new, 'no block given' unless block || arg1
    raise TypeError.new, "#{arg1} is not a symbol" unless fun.is_a?(Symbol) || block

    acc = arg2.is_a?(Symbol) || block ? arg1 : nil
    fun = fun.is_a?(Symbol) ? fun.to_proc : block
    each { |x| acc = acc.nil? ? x : fun.yield(acc, x) }
    acc
  end

  def multiply_els
    my_inject(&:*)
  end

  private

  # rubocop: disable Style/CaseEquality
  def my_any_handle_func(fun)
    if fun.is_a?(Regexp)
      my_each { |x| return true if fun.match? x.to_s }
    else
      my_each { |x| return true if fun === x }
    end
    false
  end

  # rubocop: enable Style/CaseEquality
  # rubocop: disable Style/CaseEquality
  def my_all_handle_func(fun)
    if fun.is_a?(Regexp)
      my_each { |x| return false unless fun.match? x.to_s }
    else
      my_each { |x| return false unless fun === x }
    end
    true
  end
  # rubocop: enable Style/CaseEquality
end

def multiply_els(arr)
  arr.to_a.my_inject(&:*)
end
# rubocop: enable Metrics/ModuleLength
