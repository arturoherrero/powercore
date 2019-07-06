class String
  # Returns the first characters of the string.
  def first(n = nil)
    n.nil? ? self[0] : n.zero? ? "" : self[0..n - 1]
  end

  # Returns the first character of the string.
  def head
    self[0]
  end

  # The initial part of the string without its last element.
  def init
    self[0..-2]
  end

  # Returns the last chars of the string.
  def last(n = nil)
    n.nil? ? self[-1] : self[[0, self.size - n].max..-1]
  end

  # The rest of the string without its first element.
  def tail
    self[1..-1]
  end

  # Converts string to boolean.
  def to_bool
    return true  if self =~ /^true$/
    return false if self =~ /^false$/
    raise(ArgumentError, "wrong element #{self}")
  end
end
