class Center < ActiveRecord::Base
  def get_images
    if images
      return images.split("&")
    else
      return []
    end
  end
end
