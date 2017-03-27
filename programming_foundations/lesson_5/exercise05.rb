# 101 Lesson 5: Exercises (27 March 2017)
# Exercise 5

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of
# the family.

male_age_sum = 0

munsters.each_value do |data|
  male_age_sum += data["age"] if data["gender"] == "male"
end

p male_age_sum