class Hash
  # Return a copy of self with all nil elements removed.
  def compact
    self.reject { |_, v| v.nil? }
  end

  # Return the hash without keys specified.
  def except(*keys)
    self.reject { |k, _| keys.include?(k) }
  end
end
