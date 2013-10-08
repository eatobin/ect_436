require 'spec_helper'

describe "Homework 4" do

  subject { page }

  shared_examples_for "all site pages" do
    it { should(have_title(full_title(page_title))) }
    it { should(have_selector('h1', {:text => heading})) }
  end

  describe "HW4 Home Page" do
    before { visit hw4_path }

    let(:page_title) { '4' }
    let(:heading) { "Ok... let's build a drop-down list." }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }
    it { should(have_selector('td', {:text => '20'})) }
    it { should(have_selector('td', {:text => 'ACCOUNTING'})) }
    it { should(have_selector('td', {:text => 'BOSTON'})) }
    it { should(have_field(:dname_dd)) }
  end

  describe "HW4 Page 4" do
    before do
      visit hw4_path
      select('SALES', {:from => :dname_dd})
      click_button("Select Department")
    end
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
  end
end
