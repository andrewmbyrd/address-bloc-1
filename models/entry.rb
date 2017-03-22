require 'bloc_record'

class Entry < BlocRecord::Base

  #belongs_to :address_book

  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

  #we're only implementing this for specifically 'update_name' as per assignment specification
  def method_missing(attempted_method_name, *args, &block)

    if attempted_method_name == "update_name"
      update = {"name" => args.first}
      self.class.update(self.id, update)
    end
  end

end
