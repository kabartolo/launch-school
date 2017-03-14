# Exercise 12

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"],
            ["mike@email.com", "42 Neverwhere Ave.", "000-000-00000"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

def get_contact_by_first_name(name, contact_list)
  contact_list.each_key do |key| 
    return key if key.split(" ")[0].downcase == name.downcase
  end
  return nil
end

def get_first_name_from_email(email)
  name = email.match(/.*(?=@)/)
  name.to_s
end

def make_hash(keys, values)
  hash = {}
  keys.each_with_index { |key, i| hash[key] = values[i] }
  return hash
end

def put_contact_data(contact_data, contact_list, fields)
  contact_data.each do |data_array|
    first_name = get_first_name_from_email(data_array[0])
    contact = get_contact_by_first_name(first_name, contact_list)
    if contact == nil
      next #  skip if there is no contact for this data
    end
    data_hash = make_hash(fields, data_array)
    contact_list[contact] = data_hash
  end
  contact_list
end

p put_contact_data(contact_data, contacts, [:email, :address, :phone])

# Exercise 13

p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]

# Exercise 14

# See exercise 12