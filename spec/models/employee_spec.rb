require 'spec_helper'

describe Employee do
  it "should return TOBIN as first employee" do
    Employee.first.ename.should eq("TOBIN")
  end

  it "should return TOBIN as last employee" do
    Employee.last.ename.should eq("TOBIN")
  end

  it "should return TOBIN as employee => 9" do
    Employee.where({ :id => 9 }).first.ename.should eq("TOBIN")
  end
end

describe Employee2 do

  describe "Employee2-2" do
    it "should return TOBIN as first employee" do
      expect(Employee.first.ename.should eq("TOBIN"))
    end
  end
end
