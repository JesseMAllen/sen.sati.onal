# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  name       :string(255)
#  dateSaved  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Bookmark do
  
  before do
     @bookmark = Bookmark.new(name: "daring fireball", url: "daringfireball.net") 
   end
  
  subject { @bookmark }
  
  it { should respond_to(:name) }
  it { should respond_to(:url) }
  
  describe "when name is not present" do
    before { @bookmark.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @bookmark.name = "a" * 100 }
    it { should_not be_valid }
  end
  
  describe "when url is not present" do
    before { @bookmark.url = " " }
    it { should_not be_valid }
  end
  
  describe "when url is too short" do
    before { @bookmark.url = "a" * 9 }
    it { should_not be_valid }
  end
end