class NoveltiesController < ApplicationController
  def index
    @centers = Center.news
    @adverts = Advert.news
  end

  def betters
    @centers = Center.betters
  end
end
