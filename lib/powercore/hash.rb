class Hash
  # Returns the hash without the keys specified.
  def except(*keys)
    self.reject { |k, _| keys.include?(k) }
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
end
