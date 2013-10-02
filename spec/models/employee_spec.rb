require 'spec_helper'

describe Employee do

  describe "Validate Employees" do

    it "should return KING as first employee" do
      Employee.first.ename.should eq("KING")
    end

    it "should return MILLER as last employee" do
      Employee.last.ename.should eq("MILLER")
    end

    it "should return WARD as employee :id => 9" do
      Employee.where({:id => 9}).first.ename.should eq("WARD")
    end
  end
end
