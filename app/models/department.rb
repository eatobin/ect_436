# see section 7.3.2
# and http://net.tutsplus.com/tutorials/ruby/active-record-the-rails-database-bridge/

class Department < ActiveRecord::Base
  has_many :employees
end
