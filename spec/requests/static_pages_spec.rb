require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do

  	it "should exist" do
      get static_pages_home_path
      response.status.should be(200)
  	end

    it "should have the content 'SV-Now'" do
    	# using the capybara 'visit' method and 'page' variable
    	visit '/static_pages/home'
    	expect(page).to have_content('SV-Now')
    end

    it "should have the right title" do
    	visit '/static_pages/home'
    	expect(page).to have_title('SV-Now')
    end
  end

  describe "Help Page" do

  	it "should exist" do
  		get static_pages_help_path
  		response.status.should be(200)
  	end

  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help')
  	end

    it "should have the right title" do
    	visit '/static_pages/help'
    	expect(page).to have_title('Help')
    end
  end

  describe "About Page" do

  	it "should exist" do
  		get static_pages_about_path
  		response.status.should be(200)
  	end

  	it "should have the content 'About'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About')
  	end

    it "should have the right title" do
    	visit '/static_pages/about'
    	expect(page).to have_title('About')
    end
  end

end
