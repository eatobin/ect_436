# load('hash_tester.rb')

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
  my_dept = Department.where({:id => dept_id}).first
  my_array = my_dept.employees
  my_array.each do |h|
    f
    puts("#{h.ename} - #{h.job} - #{h.sal}")
  end
end

def make_dd2
  Department.all.sort_by { |d| d[:dname] }.each do |dd|
    puts("#{dd.deptno} - #{dd.dname} - #{dd.loc}")
  end
end

def f_dd
  Cone.order(:flavor).distinct.pluck(:flavor)
end

def s_dd
  Cone.order(:scoops).distinct.pluck(:scoops)
end

def all_cones
  Cone.all
end

def all_cones1
  Cone.all.unscoped
end

def do_it
  all_cones1.each do |dd|
    puts("#{dd.id} - #{dd.pname}")
  end
end

def do_it2
  all_cones.each do |dd|
    puts("#{dd.id} - #{dd.pname}")
  end
end

def all_cones3
  all_cones.order(:id)
end

class Slot
  attr_reader :name, :start, :end

  def initialize
    @name = 'Slot_new'
    @start = Time.new(2014)
    @end = @start + 1800
  end
end
