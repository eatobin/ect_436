require 'spec_helper'

describe Department do

  describe "Validate Departments" do

    it "should validate ACCOUNTING as first dept" do
      Department.first.dname.should eq("ACCOUNTING")
    end

    it "should validate OPERATIONS as last dept" do
      Department.last.dname.should eq("OPERATIONS")
    end

    it "should validate SALES as dept :id => 3" do
      Department.where({:id => 3}).first.dname.should eq("SALES")
    end
  end

  describe "Validate Department Employees" do

    it "should validate WARD as only SALES employee" do
      emp_array = Department.where({:id => 4}).first.employees
      emp_array.length.should eq(1)
      emp_array[0].ename.should eq("WARD")
    end

    it "should validate MILLER as 1 of 3 ACCOUNTING employees" do
      emp_array = Department.where({:id => 1}).first.employees
      emp_array.length.should eq(3)
      emp_array.any? { |e| e["ename"] == "MILLER" }.should be_true
    end
  end
end
