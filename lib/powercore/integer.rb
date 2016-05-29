class Integer
  # Clamp a comparable between a lower and upper bound.
  def clamp(min, max = nil)
    if max.nil? && min.is_a?(Range)
      self < min.min ? min.min : self > min.max ? min.max : self
    else
      self < min ? min : self > max ? max : self
    end
  end

  # Convert a number of degrees into radians.
  def degrees
    self * Math::PI / 180
  end

  # Negate the number.
  def negative
    -self
  end

  # Return the ordinal of the number.
  def ordinal
    self.to_s +
      if (11..13).include?(self % 100)
        "th"
      else
        case self % 10
        when 1 then "st"
        when 2 then "nd"
        when 3 then "rd"
        else "th"
        end
      end
  end
end
