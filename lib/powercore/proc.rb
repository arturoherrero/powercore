class Proc
  # Proc forward composition.
  def >>(f)
    ->(*args) { f.call(self.call(*args)) }
  end

  # Proc reverse composition.
  def <<(f)
    ->(*args) { self.call(f.call(*args)) }
  end
end
