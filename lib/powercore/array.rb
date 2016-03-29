class Array
  # Drop n elements from the array.
  old_drop = instance_method(:drop)
  define_method(:drop) do |n|
    n >= 0 ? old_drop.bind(self).call(n) : self[0..n-1]
  end

  # Return the head of the array.
  def head
    self.first
  end

  # Build the histogram in a hash.
  def histogram
    self.each_with_object(Hash.new(0)) { |n, h| h[n] += 1 }
  end

  # Calculate the mean of the elements.
  def mean
    self.sum ? self.sum.to_f / self.size : nil
  end
  alias_method :average, :mean

  # Calculate the median of the elements.
  def median
    return nil if self.empty?
    sorted = self.sort
    size = self.size

    if size % 2 == 1
      sorted[size / 2]
    else
      (sorted[(size - 1) / 2] + sorted[size / 2]) / 2.0
    end
  end

  # Find the mode value/s.
  def mode
    max = histogram.values.max
    histogram.map { |key, value| key if value == max }.compact
  end

  # Return the percentile value for a given percentage.
  def percentile(percentage)
    size = self.size

    if size > 1
      index = size * percentage / 100.0
      self.sort[index]
    else
      self.first
    end
  end

  # Calculate the sum of the elements.
  def sum
    self.inject { |sum, n| sum ? sum + n : n }
  end

  # Return n elements from the array.
  old_take = instance_method(:take)
  define_method(:take) do |n|
    n >= 0 ? old_take.bind(self).call(n) : self.last(n.abs)
  end

  # Return the tail of the array.
  def tail
    self[1..-1]
  end

  # Assumes that self is an array of arrays or ranges
  # and transposes the rows and columns.
  old_transpose = instance_method(:transpose)
  define_method(:transpose) do
    old_transpose.bind(self.map(&:to_a)).call
  end
end
