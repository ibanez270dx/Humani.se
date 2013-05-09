module ApplicationHelper
  
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  #OPTIMIZE ...didn't really want to add the Filepicker gem just for these two methods
  def filepicker_image_tag(url, image_options={}, image_tag_options={})
    image_tag(filepicker_image_url(url, image_options), image_tag_options)
  end
  
  def filepicker_image_url(url, options = {})
    query_params = options.slice(:w, :h, :fit, :align, :crop, :format, :quality, :watermark, :watersize, :waterposition).to_query
    [url, "/convert?", query_params].join
  end
  
end
