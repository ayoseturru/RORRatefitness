class NoveltiesController < ApplicationController
  def index
    @centers = Center.news
    @adverts = Advert.news
  end
end
