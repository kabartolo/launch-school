# 120 OOP: Lesson 4: Exercises: Medium 1  (26 May 2017)
# Question 6

# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# Answer: In the first, the #show_template uses the
# getter method (#template) provided
# by attr_accessor :template. However, it does not use the built-in
# setter method (which requires self) in the #create_template
# method but rather accesses template directly using @.
# The second example's #show_template method uses self but it 
# isn't necessary. In #create_template, it uses the built-in
# setter method, which requires self.
# Ruby guide: Avoid self where not required.