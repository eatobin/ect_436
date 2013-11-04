require 'spec_helper'

describe Cone do
  describe "Validate Cones" do
    it "should return Brown Derby as first cone" do
      NeverMelt.first.pname.should eq("Brown Derby")
    end

    it "should return Mt. Everest as last cone" do
      NeverMelt.last.pname.should eq("Mt. Everest")
    end

    it "should return Little Red as cone :id => 4" do
      NeverMelt.where({:id => 4}).first.pname.should eq("Little Red")
    end
  end
end
