require 'spec_helper'

describe "Homework 2" do

  let(:base_title) { "EAT ECT 436" }

  describe "HW2 Home Page" do

    it "should have the title 'EAT ECT 436 | 2'" do
      visit hw2_path
      expect(page).to have_title("#{base_title} | #{'2'}")
    end

    it "should have the content 'Who is this strange guy?:'" do
      visit hw2_path
      expect(page).to have_content('Who is this strange guy?:')
    end

    it "should have a header containing 'Return Home'" do
      visit hw2_path
      expect(page).to have_content('Return Home')
    end

    it "should have a text input field named ':query'" do
      visit hw2_path
      expect(page).to have_field(:query)
    end
  end

  describe "HW 2 Page 2" do
    before do
      visit hw2_path
      fill_in(:query, :with => 'This is a test!')
      click_button("Send It!")
    end

    it "should have the title 'EAT ECT 436 | 2 - 2'" do
      expect(page).to have_title("#{base_title} | #{'2 - 2'}")
    end

    it "should have a header containing 'Return Home'" do
      visit hw2_path
      expect(page).to have_content('Return Home')
    end

    it "should have the content 'This is a test!'" do
      expect(page).to have_content('This is a test!')
    end

    it "should have the content '[This, is, a, test!]'" do
      expect(page).to have_content('["This", "is", "a", "test!"]')
    end

    it "should have the content '[test!, a, is, This]'" do
      expect(page).to have_content('["test!", "a", "is", "This"]')
    end

    it "should have the content '[test!*a*is*This]'" do
      expect(page).to have_content('test!*a*is*This')
    end
  end
end
