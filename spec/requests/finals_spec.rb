require 'spec_helper'

describe "Homework Final" do

  subject { page }

  shared_examples_for "all site pages" do
    it { should(have_title(full_title(page_title))) }
    it { should(have_selector('h2', {:text => heading})) }
  end

  describe "NeverMelt Home Page" do
    before { visit nevermelt_path }

    let(:page_title) { 'Final' }
    let(:heading) { 'Chocolate' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }
    # it { should(have_field(:query)) }
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
