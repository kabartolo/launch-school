# Medium 1: Exercise 4: 1000 Lights (21 April 2017)

# You have a bank of switches before you numbered from 1
# to 1000. Each switch is connected to exactly one light that
# is initially off. You walk down the row of switches, and turn
# every one of them on. Then, you go back to the beginning
# and toggle switches 2, 4, 6, and so on. Repeat this for switches
# 3, 6, 9, and so on, and keep going until you have been through
# 1000 repetitions of this process. (The next round is to switch
# on 4, 8, 12...?, the next is 5, 10, 15...?

# Write a program that determines which lights are on at the end.
# round > 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
# switch
#     1   +  +  +  +  +  +  +  +  +  + 
#     2   +  -  -  -  -  -  -  -  -  -
#     3   +  +  -  -  -  -  -  -  -  -
#     4   +  -  -  +  +  +  +  +  +  +
#     5   +  +  +  +  -  -  -  -  -  -
#     6   +  -  +  +  +  -  -  -  -  -
#     7   +  +  +  +  +  +  -  -  -  -
#     8   +  -  -  +  +  +  +  -  -  -
#     9   +  +  -  -  -  -  -  -  +  +
#     10  +  -  -  -  +  +  +  +  +  -


def switch_light!(light, lights)
  if lights[:off].include?(light)
    lights[:on] << lights[:off].delete(light)
  else
    lights[:off] << lights[:on].delete(light)
  end
end

def lights_on(n)
  lights = { on: [], off: (1..n).to_a }
  
  1.upto(n) do |pass_number|
    (pass_number..n).step(pass_number) { |light| switch_light!(light, lights) }
  end
  
  lights[:on]
end

p lights_on(1000)

### Using an array ###

def switch_light!(light, lights)
  lights.include?(light) ? lights.delete(light) : lights << light
end

def lights_on(n)
  lights_on = []

  1.upto(n) do |pass_number|
    (pass_number..n).step(pass_number) { |light| switch_light!(light, lights_on) }
  end

  lights_on
end

p lights_on(1000)
