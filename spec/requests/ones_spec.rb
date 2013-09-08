require 'spec_helper'

describe "Homework 1" do

  let(:base_title) { "EAT_ECT 436" }

  describe "Home page" do

    it "should have the title 'EAT_ECT 436'" do
      visit '/one/home'
      expect(page).to have_title("#{base_title}")
    end

    it "should not have the title 'EAT_ECT 436 | 1'" do
      visit '/one/home'
      expect(page).not_to have_title('| 1')
    end

    it "should have the content 'Welcome!'" do
      visit '/one/home'
      expect(page).to have_content('Welcome!')
    end
  end
end
