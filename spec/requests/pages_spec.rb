require 'spec_helper'

describe "Pages" do

	#let(:base_title) { "HBSC Puma |"}

	subject { page }

	describe "Home page" do
		before { visit root_path }
		it { should have_selector('h1', text: 'Home') }
    it { should have_selector('title', text: full_title('') ) }
    it { should_not have_selector 'title', text: '| Home'}
	end

	describe "About page" do
		before { visit about_path}
		it { should have_selector('h1', text: 'About') }
		it { should have_selector('title', text: full_title('About') ) }	
	end

	describe "Contact page" do
		before { visit contact_path}
		it { should have_selector('h1', text: 'Contact') }
		it { should have_selector('title', text: full_title('Contact') ) }	
	end

	describe "Master page" do
		before { visit master_path}
		it { should have_selector('h1', text: 'Master Data') }
		it { should have_selector('title', text: full_title('Master Data') ) }	
	end

	it "should have the right link on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector 'title', text: full_title('About')
		click_link "Contant"
		page.should have_selector 'title', text: full_title('Contact')
		click_link "Master Data"
		page.should have_selector 'title', text: full_title('Master Data')
		click_link "Home"
		click.link "Register"
		page.should have_selector 'title', text: full_title('Register')
	end

end
