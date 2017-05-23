# Implement a search(query) method that searches an array
# of hashes based on a hash of search criteria.

PRODUCTS = [ 
           { name: 'Thinkpad X710', price: 400},
           { name: 'Thinkpad x200', price: 250},
           { name: 'Macbook Air', price: 680},
           { name: 'Dell Latitude', price: 400},
           { name: 'Dell Inspiron', price: 400}
]

query = {
  price_min: 200,
  price_max: 280, 
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

# input: array of hashes
# output: array of hashes

# data structures: select

def search(query)
  price_min = query[:price_min]
  price_max = query[:price_max]
  q = query[:q]

  PRODUCTS.select do |item_hash|
    item_hash[:name].downcase.include?(q) &&
    (price_min..price_max).include?(item_hash[:price])
  end
end

p search(query)
# => [ { name: 'Thinkpad', price: 250 } ]
p search(query2)
#=> [ { name: 'Dell Inspiron', price: 400  } ]
