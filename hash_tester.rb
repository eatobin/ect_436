# d1 = Department.create( {:deptno => 101, :dname => 'sales', :loc => 'tuc'} )

# d2 = Department.create( {:deptno => 102, :dname => 'accounting', :loc => 'tuc'} )

def print_it
  my_array = Department.all
  my_array.each do |h|
    h.attributes.each do |key, value|
      puts("#{key} - #{value}")
    end
    puts()
  end
end

def print_it2
  my_array = Department.all
  my_array.each do |h|
      puts("#{h.deptno} - #{h.dname}")
  end
  puts()
end

def make_dd
  dd = Array.new
  all_depts = Department.all
  all_depts.each do |d|
    dd << d.dname
  end
  p(dd)
end
