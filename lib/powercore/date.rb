class Date
  # Return the current day.
  def self.now
    DateTime.now.to_date
  end
end
