class NewsController < ApplicationController
  def index
    @centers = Center.news
    render "centers/index"
  end
end
