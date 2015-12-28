class CentersController < ApplicationController
  before_action :set_center, only: [:show]
  before_action :authenticate, only: [:edit, :update, :destroy, :create]

  def index
    @centers = Center.filter(params[:filter])
    if @centers.present?
      respond_to do |format|
        format.html
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js { render "fail_search.js.erb" }
      end
    end
  end

  def show
    redirect_to({action: :index}, notice: 'Centro no encontrado') unless @center
  end

  def set_center
    @center = Center.find_by_id(params[:id])
  end

  def opinions
    @center = Center.find_by_id(params[:id])
  end
end

# def index
#   @articles = Article.con_titulo(params[:buscar])
#   if @articles.present?
#     respond_to do |format|
#       format.html
#       format.js
#     end
#   else
#     respond_to do |format|
#       format.html
#       format.js { render "fallo_articulos.js.erb" }
#     end
#   end
# end