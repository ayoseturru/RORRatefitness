class SearchsController < ApplicationController
  def filter
    # @centers = Center.search_filter(params[:mun], (params[:price] or "low"), (params[:stars] or "0"), get_service(params[:aerobic]),
    #                                 get_service(params[:fitness]), get_service([:aquagym]), get_service(params[:tennis]),
    #                                 get_service(params[:zumba]))
    # @mun = params[:mun]
    # @price = params[:price]
    # @stars = params[:stars]
    # @fitness = params[:fitness]
    @centers = Center.search_filter(params[:mun], params[:price], params[:stars], get_service(params[:aerobic]),
                                    get_service(params[:fitness]), get_service(params[:aquagym]),
                                    get_service(params[:tennis]), get_service(params[:zumba]))
  end

  def get_service(service)
    if service
      return "1"
    end
    return ""
  end


end
