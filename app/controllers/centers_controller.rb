class CentersController < ApplicationController
  def index
    @centers = Center.all
  end

  def show

  end
end
