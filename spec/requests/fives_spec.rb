require 'spec_helper'

describe "Homework 5" do

  subject { page }

  shared_examples_for "all site pages" do
    it { should(have_title(full_title(page_title))) }
    it { should(have_selector('h1', {:text => heading})) }
  end

  describe "HW5 Home Page" do
    before { visit hw5_path }

    let(:page_title) { '5' }
    let(:heading) { "Choose An Ice Cream Cone (use the DDL if you'd like):" }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_field(:narrow_dd)) }
    it { should have_button('Submit') }
    it { should have_button('Reset') }
    it { should(have_selector('td', {:text => 'Fudge Slide'})) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should(have_selector('td', {:text => 'Little Red'})) }
  end

  describe "HW5 Home Page - Narrow By DD" do
    before do
      visit hw5_path
      select('Flavors', {:from => :narrow_dd})
      click_button("Submit")
    end

    let(:page_title) { '5' }
    let(:heading) { "Choose An Ice Cream Cone (use the DDL if you'd like):" }

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

  describe "HW5 Home Page - By Flavor DD" do
    before do
      visit hw5_path
      select('Flavors', {:from => :narrow_dd})
      click_button("Submit")

      select('Chocolate', {:from => :flavors_dd})
      click_button("Submit")
    end

    let(:page_title) { '5' }
    let(:heading) { "Choose An Ice Cream Cone (use the DDL if you'd like):" }

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

  describe "HW5 Home Page - By Flavor/Scoops DD" do
    before do
      visit hw5_path
      select('Flavors', {:from => :narrow_dd})
      click_button("Submit")

      select('Chocolate', {:from => :flavors_dd})
      click_button("Submit")

      select('3 Scoops', {:from => :scoops2_dd})
      click_button("Submit")
    end

    let(:page_title) { '5' }
    let(:heading) { "Choose An Ice Cream Cone (use the DDL if you'd like):" }

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

  describe "HW5 Home Page - Reset" do
    before do
      visit hw5_path
      select('Flavors', {:from => :narrow_dd})
      click_button("Submit")

      select('Chocolate', {:from => :flavors_dd})
      click_button("Submit")

      select('3 Scoops', {:from => :scoops2_dd})
      click_button("Submit")

      click_button("Reset")
    end

    let(:page_title) { '5' }
    let(:heading) { "Choose An Ice Cream Cone (use the DDL if you'd like):" }

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

  #describe "HW5 Page 2" do
  #  #before do
  #  #  visit hw5p2_path
  #  #  #  fill_in(:query, {:with => 'This is a test!'})
  #  #  #  click_button("Send It!")
  #  #end
  #
  #  let(:page_title) { '5 - 2' }
  #  let(:heading) { "Here are the details for your product:" }
  #
  #  it_should_behave_like("all site pages")
  #
  #  it { should(have_link('Return Home', href: root_path)) }
  #  #it { should(have_content('This is a test!')) }
  #  #it { should(have_content('["This", "is", "a", "test!"]')) }
  #  #it { should(have_content('["test!", "a", "is", "This"]')) }
  #  #it { should(have_content('test!*a*is*This')) }
  #end
end
