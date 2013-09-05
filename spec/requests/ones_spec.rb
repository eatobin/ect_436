require 'spec_helper'

describe "Homework 1" do

  let(:base_title) { "Eric Tobin - ECT 436 - Assignment #" }

  describe "Home page" do

    it "should have the title 'Eric Tobin - ECT 436 - Assignment #1'" do
      visit '/one/home'
      expect(page).to have_title("#{base_title}1")
    end

    it "should have the content 'Welcome!'" do
      visit '/one/home'
      expect(page).to have_content('Welcome!')
    end
  end
end
