require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
      # it "should have the h1 content 'Welcome!'" do
      #   expect(page).to have_selector('h1', {:text => 'Welcome!'})
      # end
    it { should have_title(full_title(page_title)) }
    # expect(page).to have_selector('title', {:text => full_title(''), :visible => false})
  end

  describe "Home page" do
    before { visit root_path }

    let(:heading) { 'Welcome!' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title(' | 1') }
  end
