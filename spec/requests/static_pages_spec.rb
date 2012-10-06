require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
     it { should have_selector('h1', text: 'sen.sati.onal') }
     it { should have_selector('title', text: full_title('')) }
      it { should_not have_selector 'title', text: '| Home' }
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "Add"
    page.should have_selector 'title', text: full_title('Create')
    click_link "View"
    page.should have_selector 'title', text: full_title('View Bookmarks')
    click_link "Home"
    click_link "sen.sati.onal"
    page.should have_selector 'title', text: full_title('')
  end
end
