require 'spec_helper'

describe "Bookmarks" do

  subject { page }

  shared_examples_for "all bookmarks pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Add Bookmark Page" do
    before { visit create_path }
    let(:heading)    { 'Create a Bookmark' }
    let(:page_title) { 'Create' }
    let(:submit) { "Add Bookmark" }
    
    it_should_behave_like "all bookmarks pages"
    
    describe "with invalid information" do
      it"should not create a bookmark" do
        expect { click_button submit }.not_to change(Bookmark, :count)
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Name",   with: "Daring Fireball"
        fill_in "Url",    with: "www.daringfireball.net"
      end
      
      it "should create a bookmark" do
        expect { click_button submit }.to change(Bookmark, :count).by(1)
      end
    end
  end
  
  describe "View Bookmarks Page" do
    let(:bookmark) { FactoryGirl.create(:bookmark) }
    let!(:mark1) { FactoryGirl.create(:bookmark, name:"Daring Fireball", url:"www.daringfireball.net") }
    let!(:mark2) { FactoryGirl.create(:bookmark, name:"Stack Overflow", url:"www.stackoverflow.com") }
    
    before { visit show_path }
    
    let(:heading) { 'View Bookmarks'}
    let(:page_title) { 'Bookmarks' }
    
    describe "bookmarks" do
      it { should have_content(mark1.name) }
      it { should have_content(mark1.url) }
      it { should have_content(mark2.name) }
      it { should have_content(mark2.url) }
    end
        
    it_should_behave_like "all bookmarks pages"
  end
end
  
