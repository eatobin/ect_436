require 'spec_helper'

describe "Homework 5" do

  subject { page }

  shared_examples_for "all site pages" do
    it { should(have_title(full_title(page_title))) }
    it { should(have_selector('h1', {:text => heading})) }
  end

  #describe "HW5 Home Page" do
  #  before { visit hw5_path }
  #
  #  let(:page_title) { '2' }
  #  let(:heading) { 'Who is this strange guy?:' }
  #
  #  it_should_behave_like("all site pages")
  #  it { should(have_link('Return Home', href: root_path)) }
  #  #it { should(have_field(:query)) }
  #end

  describe "HW5 Page 2" do
    before do
      visit hw5p2_path
    #  fill_in(:query, {:with => 'This is a test!'})
    #  click_button("Send It!")
    end

    let(:page_title) { '5 - 2' }
    let(:heading) { "Here are the details for your product:" }

    it_should_behave_like("all site pages")

    it { should(have_link('Return Home', href: root_path)) }
    #it { should(have_content('This is a test!')) }
    #it { should(have_content('["This", "is", "a", "test!"]')) }
    #it { should(have_content('["test!", "a", "is", "This"]')) }
    #it { should(have_content('test!*a*is*This')) }
  end
end
