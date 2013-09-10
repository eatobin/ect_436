require 'spec_helper'

describe "Homework 1" do

  let(:base_title) { "EAT ECT 436" }

  describe "Home page" do

    it "should have the title 'EAT ECT 436'" do
      visit root_path
      expect(page).to have_title("#{base_title}")
    end

    it "should not have the title 'EAT ECT 436 | 1'" do
      visit root_path
      expect(page).not_to have_title('| 1')
    end

    it "should have the content 'Welcome!'" do
      visit root_path
      expect(page).to have_content('Welcome!')
    end

    it "should not have a header" do
      visit root_path
      expect(page).not_to have_content('Return Home')
    end
  end
end
