require 'spec_helper'

describe "Homework 3" do

  subject { page }

  shared_examples_for "all site pages" do
    it { should(have_title(full_title(page_title))) }
    it { should(have_selector('h1', {:text => heading})) }
  end

  describe "HW3 'Home' Page" do
    before { visit hw3_path }

    let(:page_title) { '3' }
    let(:heading) { "I hear you're planning a little trip:" }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }
    it { should(have_field(:state)) }
    it { should(have_field(:pet)) }
  end

  describe "HW3 Page '2'" do
    before do
      visit hw3_path
      select('Arizona', {:from => :state})
      choose('pet_horse')
      click_button("Send It!")
    end

    let(:page_title) { '3' }
    let(:heading) { "So, you're going to visit Arizona." }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }
    it { should(have_selector('h3', {:text => "Great, while you're there be sure to visit the capital Phoenix and see the Grand Canyon!"})) }
    it { should(have_selector('h3', {:text => "I don't know WHAT you can do in Arizona with a horse in tow!"})) }
    it { should(have_content("This is repetition 0 using '5.times' (notice starts at 0).")) }
    it { should(have_content("This is repetition 4 using '5.times' (notice starts at 0).")) }
    it { should(have_content("This is repetition 1 using '(1..7).each' (starts at 1, not 0!).")) }
    it { should(have_content("This is repetition 7 using '(1..7).each' (starts at 1, not 0!).")) }
  end
end
