class Hash
  # Return a copy of self with all nil elements removed.
  def compact
    self.reject { |_, v| v.nil? }
  end

  # Return the hash without keys specified.
  def except(*keys)
    self.reject { |k, _| keys.include?(k) }
  end

  # Extracts the nested value specified by the sequence of idx objects
  # by calling dig at each step. If the key can’t be found, there are
  # two options: With no other arguments, it will raise an KeyError
  # exception; if the optional code block is specified, then that will
  # be run and its result returned.
  def fetch_dig(*keys, &block)
    keys.inject(self) { |hash, element| hash.fetch(element) }
  rescue KeyError
    block&.call || raise
  end
end
