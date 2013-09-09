require 'spec_helper'

describe "Homework 2" do

  let(:base_title) { "EAT ECT 436" }

  describe "Home page" do

    it "should have the title 'EAT ECT 436 | 2'" do
      visit hw2_path
      expect(page).to have_title("#{base_title} | #{2}")
    end

    it "should have the content 'Who is this strange guy?:'" do
      visit hw2_path
      expect(page).to have_content('Who is this strange guy?:')
    end
  end
end
