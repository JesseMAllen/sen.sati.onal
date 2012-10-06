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
  
  before { @bookmark = Bookmark.new(name: "daring fireball", url: "daringfireball.net", dateSaved: Date.today) }
  
  subject { @bookmark }
  
  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:dateSaved) }
  
  describe "when name is not present" do
    before { @bookmark.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @bookmark.name = "a" * 100 }
    it { should_not be_valid }
  end
end