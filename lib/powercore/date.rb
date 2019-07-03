require "date"

class Date
  # Returns the current day.
  def self.now
    DateTime.now.to_date
  end
end
