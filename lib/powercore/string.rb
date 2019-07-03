class String
  # Returns the first chars of the string.
  def first(n = nil)
    n.nil? ? self[0] : n.zero? ? "" : self[0..n - 1]
  end

  # Returns the last chars of the string.
  def last(n = nil)
    n.nil? ? self[-1] : self[[0, self.size - n].max..-1]
  end

  # Converts string to boolean.
  def to_bool
    return true  if self =~ /^true$/
    return false if self =~ /^false$/
    raise(ArgumentError, "wrong element #{self}")
  end
end
