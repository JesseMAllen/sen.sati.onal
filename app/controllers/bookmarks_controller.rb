class BookmarksController < ApplicationController
  def create
      @bookmark = Bookmark.new(params[:bookmark])
      if @bookmark.save
        redirect_to @bookmark
      else
        render 'new'
      end
  end
  
  def show
    @bookmarks = Bookmark.all
  end
  
  def new
     @bookmark = Bookmark.new
  end
end
