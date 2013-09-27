def print_it
  my_array = Department.all
  my_array.each do |h|
    #h.each do |key, value|
      #puts("#{key} - #{value}")
    #end
    p(h)
  end
end
