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
    puts("#{h.deptno} - #{h.dname} - #{h.loc}")
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

def print_it3(deptno)
  my_array = Employee.where({:deptno => deptno})
  my_array.each do |h|
    puts("#{h.ename} - #{h.job} - #{h.sal}")
  end
  puts()
end

def print_it4(dept_id)
  my_dept = Department.where({:id => dept_id}).first
  p(my_dept)
  p(my_dept.employees)
  my_dept.employees.length
end

def print_it5(dept_id)
  my_array = Array.new
  my_dept = Department.where({:id => dept_id}).first
  my_array = my_dept.employees
  my_array.each do |h|
    puts("#{h.ename} - #{h.job} - #{h.sal}")
  end
end
