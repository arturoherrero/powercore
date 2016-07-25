class Object
  # Assert an expression.
  AssertError = Class.new(StandardError)
  def assert(expression)
    raise(AssertError, "assertion failed") unless expression
  end

  # Return true if self is present in the given object.
  def in?(object)
    object.include?(self)
  end

  # Return the eigenclass.
  def metaclass
    class << self
      self
    end
  end

  # Return true if self is not present in the given object.
  def not_in?(object)
    !in?(object)
  end

  # Return true when an object is not nil.
  def not_nil?
    !nil?
  end

  # Emulate Smalltalk's conditionals.
  def true.-(a, &b)
    a.call
  end
  def false.-(a, &b)
    b.call
  end

  # Pipe operator à la Bash/Elixir.
  [Fixnum, Bignum, Array, Set, TrueClass, FalseClass, NilClass].each do |klass|
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
