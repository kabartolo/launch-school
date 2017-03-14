# Hashes: Exercise 2

saved_cart = { book: 2, lawnmower: 1, yarn: 4, spaghetti: 3 }
item = { hammer: 2 }

def add_item_to_cart(cart, item)
  cart.merge(item)
end

def add_and_save(cart, item)
  cart.merge!(item)
end

new_cart = add_item_to_cart(saved_cart, item)
p new_cart
p saved_cart # original not modified

new_cart = add_and_save(saved_cart, item)
p new_cart
p saved_cart # original cart permanently modified