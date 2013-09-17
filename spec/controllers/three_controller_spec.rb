require 'spec_helper'

describe ThreeController do

  describe "GET 'hw3'" do
    it "returns http success" do
      get 'hw3'
      response.should be_success
    end
  end

end
