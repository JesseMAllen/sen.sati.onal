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

class Bookmark < ActiveRecord::Base
  attr_accessible :name, :url

    
  validates :name, presence: true, length: { maximum: 99 }
  validates :url, presence: true, length: { minimum: 10 }
end
