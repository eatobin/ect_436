require 'spec_helper'

describe "Homework Final" do

  subject { page }

  shared_examples_for "all site pages" do
    it { should(have_title(full_title(page_title))) }
    it { should(have_selector('h1', {:text => heading})) }
  end

  describe "NeverMelt" do
    before { visit nevermelt_path }

    let(:page_title) { 'Final' }
    let(:heading) { 'NeverMelt Menu' }

    it_should_behave_like("all site pages")
    it { should(have_link('Return Home', href: root_path)) }

    it { should(have_field(:narrow_dd)) }
    it { should have_button('Submit') }
    it { should have_button('Reset') }
    it { should(have_link('Fudge Slide', :href => proddetail_path(pid: 2))) }
    it { should(have_link('Chocozilla', :href => proddetail_path(pid: 3))) }
    it { should(have_link('Little Red', :href => proddetail_path(pid: 4))) }
  end

  describe "NeverMelt - Narrow By DD => Flavors" do
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
    it { should(have_link('Fudge Slide', :href => proddetail_path(pid: 2))) }
    it { should(have_link('Chocozilla', :href => proddetail_path(pid: 3))) }
    it { should(have_link('Little Red', :href => proddetail_path(pid: 4))) }
  end

  describe "Homework Final NeverMelt - By Flavor DD => Chocolate" do
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
    it { should(have_link('Fudge Slide', :href => proddetail_path(pid: 2))) }
    it { should(have_link('Chocozilla', :href => proddetail_path(pid: 3))) }
    it { should_not(have_link('Little Red', :href => proddetail_path(pid: 4))) }
  end

  describe "Homework Final NeverMelt - By Flavor/Scoops DD => 3 Scoops" do
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
    it { should_not(have_link('Fudge Slide', :href => proddetail_path(pid: 2))) }
    it { should(have_link('Chocozilla', :href => proddetail_path(pid: 3))) }
    it { should_not(have_link('Little Red', :href => proddetail_path(pid: 4))) }
  end

  describe "Homework Final NeverMelt - Reset" do
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
    it { should(have_link('Fudge Slide', :href => proddetail_path(pid: 2))) }
    it { should(have_link('Chocozilla', :href => proddetail_path(pid: 3))) }
    it { should(have_link('Little Red', :href => proddetail_path(pid: 4))) }
  end

  describe "Homework Final NeverMelt - Narrow By DD => Scoops" do
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
    it { should(have_link('Fudge Slide', :href => proddetail_path(pid: 2))) }
    it { should(have_link('Chocozilla', :href => proddetail_path(pid: 3))) }
    it { should(have_link('Little Red', :href => proddetail_path(pid: 4))) }
  end

  describe "Homework Final NeverMelt - By Scoops DD => 3 Scoops" do
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
    it { should(have_link('Mt. Everest', :href => proddetail_path(pid: 9))) }
    it { should(have_link('Chocozilla', :href => proddetail_path(pid: 3))) }
    it { should_not(have_link('Little Red', :href => proddetail_path(pid: 4))) }
  end

  describe "Homework Final NeverMelt - By Scoops/Flavors DD => Chocolate" do
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
    it { should_not(have_link('Mt. Everest', :href => proddetail_path(pid: 9))) }
    it { should(have_link('Chocozilla', :href => proddetail_path(pid: 3))) }
    it { should_not(have_link('Little Red', :href => proddetail_path(pid: 4))) }
  end

  describe "ProdDetail" do
    before do
      visit nevermelt_path
      click_link('Chocozilla')
    end

    it { should(have_title(full_title('ProdDetail'))) }
    it { should(have_selector('h4', {:text => 'How many would you like?:'})) }

    it { should(have_link('Return Home', href: root_path)) }
    it { should(have_selector('td', {:text => 'Chocozilla'})) }
    it { should(have_selector('td',
                              {:text => 'Three softball-sized scoops of to-die-for chocolate.'})) }
    it { should(have_selector('td', {:text => 'Chocolate'})) }
    it { should(have_selector('td', {:text => '3 Scoops'})) }
    it { should(have_selector('td', {:text => '$6.00'})) }
    it { should(have_selector('td', {:text => '20'})) }
    it { should(have_css("img[src='/assets/choc3.gif']")) }
    it { should(have_css("img[alt='Choc3']")) }
    it { should have_button('Purchase') }
    it { should have_button('Back To Treats') }
  end

  describe "BadQuant" do
    before do
      visit nevermelt_path
      click_link('Brown Derby')

      select('3', {:from => :quant_dd})
      click_button("Purchase")
    end

    it { should(have_title(full_title('BadQuant'))) }
    it { should(have_selector('h4', {:text => 'Sorry, but you have requested more items than we have in stock.'})) }
    it { should(have_link('Return Home', href: root_path)) }

    it { should have_button('Return To Item') }
  end

  describe "BadQuant And Back To ProdDetail" do
    before do
      visit nevermelt_path
      click_link('Brown Derby')

      select('3', {:from => :quant_dd})
      click_button("Purchase")
      click_button("Return To Item")
    end

    it { should(have_title(full_title('ProdDetail'))) }
    it { should(have_selector('h4', {:text => 'How many would you like?:'})) }
  end
end
