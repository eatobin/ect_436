require 'spec_helper'

describe Department do

  describe "Validate Departments" do

    it "should return ACCOUNTING as first dept" do
      Department.first.dname.should eq("ACCOUNTING")
    end

    it "should return OPERATIONS as last dept" do
      Department.last.dname.should eq("OPERATIONS")
    end

    it "should return SALES as dept :id => 3" do
      Department.where({:id => 3}).first.dname.should eq("SALES")
    end
  end
end
