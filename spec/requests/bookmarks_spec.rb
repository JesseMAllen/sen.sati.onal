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

    it_should_behave_like "all bookmarks pages"
  end
  
  describe "View Bookmarks Page" do
    before { visit view_path }
    let(:heading) { 'View Bookmarks'}
    let(:page_title) { 'View' }
    
    it_should_behave_like "all bookmarks pages"
  end
end