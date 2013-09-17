require 'spec_helper'

describe "Homework 1" do

  subject { page }

  shared_examples_for "all site pages" do
    it { should(have_title(full_title(page_title))) }
    it { should(have_selector('h1', {:text => heading})) }
  end

  describe "HW1 Home Page" do
    before { visit root_path }

    let(:page_title) { '' }
    let(:heading) { 'Welcome!' }

    it_should_behave_like("all site pages")
    it { should_not(have_title(' | 1')) }
    it { should_not(have_link('Return Home', href: root_path)) }
  end
end
