# Challenges: Medium 1
# 23 August, 2017
# Exercise 7: Meetup
require 'date'

class Meetup
  WEEKDAYS = { sunday: 0,
               monday: 1, 
               tuesday: 2, 
               wednesday: 3, 
               thursday: 4, 
               friday: 5, 
               saturday: 6 }

  SCHEDULES= [:first, :second, :third, :fourth]

  def initialize(month, year)
    @days_in_month = (Date.new(year, month)..Date.new(year, month, -1))
  end

  def day(weekday, schedule)
    weekdays_in_month = dates_of_weekdays(weekday)

    _day = case schedule
           when :last then weekdays_in_month.last
           when :teenth then teenth_day(weekdays_in_month)
           else weekdays_in_month[SCHEDULES.index(schedule)]
           end
  end

  private

  def dates_of_weekdays(weekday)
    weekday_key = WEEKDAYS[weekday]

    @days_in_month.select { |day| day.wday == weekday_key }
  end

  def teenth_day(weekdays_in_month)
    weekdays_in_month.find { |day| (13..19).include?(day.day) }
  end
end
