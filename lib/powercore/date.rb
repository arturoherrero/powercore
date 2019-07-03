require "time"

class Date
  # Returns the current day.
  def self.now
    Time.now.to_date
  end
end
