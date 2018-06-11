module ImagesHelper

  def photo_path(image)
    rails_blob_path(image.photo)
  rescue
    ""
  end

  def photo_url(image)
    rails_blob_url(image.photo)
  rescue
    ""
  end

end
