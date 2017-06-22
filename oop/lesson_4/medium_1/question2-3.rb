# 120 OOP: Lesson 4: Exercises: Medium 1  (26 May 2017)
# Question 2

# Alyssa created the following code to keep track of items for a shopping cart
# application she's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says.

# Can you spot the mistake and how to address it?

# Answer: With or without an attr_writer for quantity, Ruby thinks we are setting
# a new local variable quantity on line 17. It must be accessed with @quantity notation
# OR change attr_reader to attr_accessor and reference quantity as self.quantity.

# Question 3
# One way to fix this is to change attr_reader to attr_accessor and change quantity to
# self.quantity.
# Is there anything wrong with fixing it this way?

# By having an attr_accessor for quantity, we are creating a public setter method that
# could be used instead of #update_quantity, which is more controlled. Thus @quantity
# is more vulnerable now.