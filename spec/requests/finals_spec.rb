require 'spec_helper'

describe "Homework Final" do

  subject { page }

  shared_examples_for "all site pages" do
    it { should(have_title(full_title(page_title))) }
    it { should(have_selector('h1', {:text => heading})) }
  end

  describe "Home Page" do
    before { visit nevermelt_path }

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_field(:narrow_dd)) }
    it { should have_button('Submit') }
    it { should have_button('Reset') }
    it { should(have_selector('td', {:text => 'Fudge Slide'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should(have_selector('td', {:text => 'Little Red'})) }
  end

  describe "Home Page - Narrow By DD => Flavors" do
    before do
      visit nevermelt_path
      select('Flavors', {:from => :narrow_dd})
      click_button("Submit")
    end

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_content('Flavors')) }
    it { should_not(have_field(:narrow_dd)) }
    it { should(have_field(:flavors_dd)) }
    it { should have_button('Submit') }
    it { should have_button('Reset') }
    it { should(have_selector('td', {:text => 'Fudge Slide'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should(have_selector('td', {:text => 'Little Red'})) }
  end

  describe "Homework Final Home Page - By Flavor DD => Chocolate" do
    before do
      visit nevermelt_path
      select('Flavors', {:from => :narrow_dd})
      click_button("Submit")

      select('Chocolate', {:from => :flavors_dd})
      click_button("Submit")
    end

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_content('Chocolate')) }
    it { should_not(have_field(:narrow_dd)) }
    it { should_not(have_field(:flavors_dd)) }
    it { should(have_field(:scoops2_dd)) }
    it { should have_button('Submit') }
    it { should have_button('Reset') }
    it { should(have_selector('td', {:text => 'Fudge Slide'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should_not(have_selector('td', {:text => 'Little Red'})) }
  end

  describe "Homework Final Home Page - By Flavor/Scoops DD => 3 Scoops" do
    before do
      visit nevermelt_path
      select('Flavors', {:from => :narrow_dd})
      click_button("Submit")

      select('Chocolate', {:from => :flavors_dd})
      click_button("Submit")

      select('3 Scoops', {:from => :scoops2_dd})
      click_button("Submit")
    end

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_content('Ok... this is it! Only one choice!')) }
    it { should_not(have_field(:narrow_dd)) }
    it { should_not(have_field(:flavors_dd)) }
    it { should_not(have_field(:scoops2_dd)) }
    it { should_not have_button('Submit') }
    it { should have_button('Reset') }
    it { should_not(have_selector('td', {:text => 'Fudge Slide'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should_not(have_selector('td', {:text => 'Little Red'})) }
  end

  describe "Homework Final Home Page - Reset" do
    before do
      visit nevermelt_path
      select('Flavors', {:from => :narrow_dd})
      click_button("Submit")

      select('Chocolate', {:from => :flavors_dd})
      click_button("Submit")

      select('3 Scoops', {:from => :scoops2_dd})
      click_button("Submit")

      click_button("Reset")
    end

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should_not(have_content('Ok... this is it! Only one choice!')) }
    it { should(have_field(:narrow_dd)) }
    it { should_not(have_field(:flavors_dd)) }
    it { should_not(have_field(:scoops2_dd)) }
    it { should have_button('Submit') }
    it { should have_button('Reset') }
    it { should(have_selector('td', {:text => 'Fudge Slide'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should(have_selector('td', {:text => 'Little Red'})) }
  end

  describe "Homework Final Home Page - Narrow By DD => Scoops" do
    before do
      visit nevermelt_path
      select('Scoops', {:from => :narrow_dd})
      click_button("Submit")
    end

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_content('Scoops')) }
    it { should_not(have_field(:narrow_dd)) }
    it { should(have_field(:scoops_dd)) }
    it { should have_button('Submit') }
    it { should have_button('Reset') }
    it { should(have_selector('td', {:text => 'Fudge Slide'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should(have_selector('td', {:text => 'Little Red'})) }
  end

  describe "Homework Final Home Page - By Scoops DD => 3 Scoops" do
    before do
      visit nevermelt_path
      select('Scoops', {:from => :narrow_dd})
      click_button("Submit")

      select('3 Scoops', {:from => :scoops_dd})
      click_button("Submit")
    end

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_content('3 Scoops')) }
    it { should_not(have_field(:narrow_dd)) }
    it { should_not(have_field(:flavors_dd)) }
    it { should(have_field(:flavors2_dd)) }
    it { should have_button('Submit') }
    it { should have_button('Reset') }
    it { should(have_selector('td', {:text => 'Mt. Everest'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should_not(have_selector('td', {:text => 'Little Red'})) }
  end

  describe "Homework Final Home Page - By Scoops/Flavors DD => Chocolate" do
    before do
      visit nevermelt_path
      select('Scoops', {:from => :narrow_dd})
      click_button("Submit")

      select('3 Scoops', {:from => :scoops_dd})
      click_button("Submit")

      select('Chocolate', {:from => :flavors2_dd})
      click_button("Submit")
    end

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_content('Ok... this is it! Only one choice!')) }
    it { should_not(have_field(:narrow_dd)) }
    it { should_not(have_field(:scoops_dd)) }
    it { should_not(have_field(:flavors2_dd)) }
    it { should_not have_button('Submit') }
    it { should have_button('Reset') }
    it { should_not(have_selector('td', {:text => 'Mt. Everest'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should_not(have_selector('td', {:text => 'Little Red'})) }
  end

  #describe "HW2 Page 2" do
  #  before do
  #    visit hw2_path
  #    fill_in(:query, {:with => 'This is a test!'})
  #    click_button("Send It!")
  #  end
  #
  #  let(:page_title) { '2 - 2' }
  #  let(:heading) { "Here's the sentence you sent from the first page:" }
  #
  #  it_should_behave_like("all site pages")
  #
  #  # works!
  #  # it "should have the title 'EAT ECT 436 | 2 - 2'" do
  #  #   expect(page).to have_selector('title', {:text => full_title('2 - 2'), :visible => false})
  #  # end
  #
  #  it { should(have_link('Return Home', href: root_path)) }
  #  it { should(have_content('This is a test!')) }
  #  it { should(have_content('["This", "is", "a", "test!"]')) }
  #  it { should(have_content('["test!", "a", "is", "This"]')) }
  #  it { should(have_content('test!*a*is*This')) }
  #end
end
