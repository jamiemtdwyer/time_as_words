# The main TimeAsWords driver
class TimeAsWords
  # Format a time in seconds, output as Xh Xmin Xs
  #
  # Example:
  #   >> TimeAsWords.format(12345)
  #   => "3h 25min 45s"
  #
  # Arguments:
  #   seconds: (Integer)

  def self.format(seconds)
    result = seconds.divmod(60)
    minutes = result.first
    seconds_left = result.last

    if minutes > 0
      result = minutes.divmod(60)
      hours = result.first
      minutes_left = result.last

      hours_string = "#{hours}h" unless hours == 0
      minutes_string = "#{minutes_left}min" unless minutes_left == 0
    end

    seconds_string = "#{seconds_left}s" unless seconds_left == 0

    "#{hours_string or ''} #{minutes_string or ''} #{seconds_string or ''}".squeeze(" ").strip
  end
end