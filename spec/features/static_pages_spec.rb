require 'spec_helper'
 
describe "Static pages" do
 
  describe "Home page" do
 
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1') do |heading|
        heading.should have_content('Sample App')
      end
    end
    
    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title') do |title|
        title.should have_content("Ruby on Rails Tutorial Sample App | Home")
      end
    end
  end
 
  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1') do |heading|
        heading.should have_content('Help')
      end
    end
    
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title') do |title|
        title.should have_content("Ruby on Rails Tutorial Sample App | Help")
      end
    end
  end
 
  describe "About" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1') do |heading|
        heading.should have_content('About Us')
      end
    end
    
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title') do |title|
        title.should have_content("Ruby on Rails Tutorial Sample App | About Us")
      end
    end
  end
end