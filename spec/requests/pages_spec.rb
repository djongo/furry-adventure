require 'spec_helper'

describe "Pages" do

	let(:base_title) { "HBSC Puma |"}

	describe "Home page" do
		it "should have the h1 'Home'" do
			visit '/pages/home'
			page.should have_selector('h1', :text =>'Home')
		end	

  	it "should have the base title" do
      visit '/pages/home'
      page.should have_selector('title',
                        :text => "#{base_title} Home")
    end		
	end

	describe "About page" do
		it "should have the h1 'About'" do
			visit '/pages/about'
			page.should have_selector('h1', :text =>'About')
		end
  	
  	it "should have the title 'About'" do
      visit '/pages/about'
      page.should have_selector('title',
                        :text => "#{base_title} About")
    end		
	end

	describe "Contact page" do
		it "should have the h1 'Contact'" do
			visit '/pages/contact'
			page.should have_selector('h1', :text =>'Contact')
		end

		it "should have the title 'Contact'" do
      visit '/pages/contact'
      page.should have_selector('title',
                        :text => "#{base_title} Contact")
    end		

	end

	describe "Master page" do
		it "should have the h1 'Master Data'" do
			visit '/pages/master'
			page.should have_selector('h1', :text =>'Master Data')
		end

  	it "should have the title 'Master Data'" do
      visit '/pages/master'
      page.should have_selector('title',
                        :text => "#{base_title} Master Data")
    end
	end
end
