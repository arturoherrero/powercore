class String
  # Return the first chars of the string.
  def first(n = nil)
    n.nil? ? self[0] : n == 0 ? "" : self[0..n-1]
  end

  # Return the last chars of the string.
  def last(n = nil)
    n.nil? ? self[-1] : self[[0,self.size-n].max..-1]
  end

  # Convert string to boolean.
  def to_bool
    return true  if self =~ (/^true$/)
    return false if self =~ (/^false$/)
    raise(ArgumentError.new "wrong element #{self}")
  end
end
