class Hash
  # Returns the hash without the keys specified.
  def except(*keys)
    self.reject { |k, _| keys.include?(k) }
  end

  # Returns the first elements.
  def first(n = nil)
    if n.nil?
      self.empty? ? nil : Hash[*self.to_a.first]
    else
      n.zero? ? {} : Hash[self.to_a[0..n - 1]]
    end
  end

  # Extracts the nested value specified by the sequence of keys.
  # If the key can’t be found, there are two options:
  # with no other argument, it will raise an KeyError exception;
  # if the optional code block is specified,
  # it will be executed and its result will be returned.
  def fetch_dig(*keys, &block)
    keys.inject(self) { |hash, key| hash.fetch(key) }
  rescue KeyError
    block&.call || raise
  end

  # Returns the first element.
  def head
    Hash[*self.to_a.first]
  end

  # The initial part of the hash without its last element.
  def init
    Hash[self.to_a[0..-2]]
  end

  # Returns the last element.
  def last
    Hash[*self.to_a.last]
  end

  # The rest of the hash without its first element.
  def tail
    Hash[self.to_a[1..-1]]
  end
end
