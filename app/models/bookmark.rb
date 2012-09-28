class Bookmark < ActiveRecord::Base
  attr_accessible :dateSaved, :name, :url
end
