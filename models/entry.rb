require 'bloc_record/base'

class Entry < BlocRecord::Base

  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

  #we're leaning heavily on the limitation that this only needs to work for the find_by method. So any attemtped method name
  #will be find_by_name or find_by_email or find_by_attributethatalreadyexistsandisspelledcorrectly
  #also args will be of length 1 and has the corresponding value in the attribute to be searched
  def method_missing(attempted_method_name, *args, &block)
    #we know the desired attribute starts after the chars find_by_, so position 8
    desired_attribute = attempted_method_name.slice(8, attempted_method_name.length - 1)
    find_by(desired_attribute, args[0]) if desired_attribute.length > 1
  end

end
