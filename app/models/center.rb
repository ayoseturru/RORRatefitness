class Center < ActiveRecord::Base
  def get_images
    return images.split("&")
  end
end
