require 'spec_helper'

describe "Homework 1" do

  describe "Home page" do
    before { visit root_path }

    it "should have the title 'EAT ECT 436'" do
      expect(page).to have_selector('title', {:text => full_title(''), :visible => false})
    end

    it "should not have the title 'EAT ECT 436 | 1'" do
      expect(page).not_to have_selector('title', {:text => full_title(' | 1'), :visible => false})
    end

    it "should have the h1 content 'Welcome!'" do
      expect(page).to have_selector('h1', {:text => 'Welcome!'})
    end

    it "should not have a header containing 'Return Home'" do
      expect(page).not_to have_link('Return Home', href: root_path)
    end
  end
end
