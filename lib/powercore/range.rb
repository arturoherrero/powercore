class Range
  # Returns the first object in the range
  def head
    self.first
  end

  # The initial part of the range without its last element.
  def init
    self.first..self.to_a[-2]
  end

  # The rest of the range without its first element.
  def tail
    self.to_a[1]..self.last
  end
end
