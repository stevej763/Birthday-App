require 'date'

class BirthdayCalculator

  def self.days_until_birthday(day, month)
    raise Date::Error if month < 1
    raise Date::Error if day < 1 

    birthday = DateTime.new(2021, month, day).yday
    result = birthday - Date.today.yday()
    if result.negative?
      result = calculate_for_negative_date_difference(result)
    end
    result
  end
end

private

def calculate_for_negative_date_difference(result)
  result += 365
end
