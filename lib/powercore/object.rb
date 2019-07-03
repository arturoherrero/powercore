class Object
  # Asserts an expression.
  AssertError = Class.new(StandardError)
  def assert(expression)
    raise(AssertError, "assertion failed") unless expression
  end

  # Returns true if self is present in the given object.
  def in?(object)
    object.include?(self)
  end

  # Returns the eigenclass.
  def metaclass
    class << self
      self
    end
  end

  # Returns true if self is not present in the given object.
  def not_in?(object)
    !in?(object)
  end

  # Returns true when an object is not nil.
  def not_nil?
    !nil?
  end

  # Pipe operator à la Bash/Elixir.
  [Integer, Array, Set, TrueClass, FalseClass, NilClass].each do |klass|
    klass.class_eval { remove_method(:|) }
  end
  def |(pipe)
    if self.is_a?(Proc)
      ->(input) { pipe.call(self.call(input)) }
    elsif pipe.is_a?(Symbol)
      self.send(pipe)
    else
      pipe.call(self)
    end
  end
end
