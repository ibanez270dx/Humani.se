module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  def human_date(date)
    suffix = case date.day
    when 1 then "st"
    when 2 || 22 then "nd"
    when 3 then "rd"
    else "th"
    end
    date.strftime("%A, %B %e#{suffix} %Y")
  end

  def nav_link_to(name, href, options = {})
    selected = [controller_name, action_name].join("#").match(/^#{options.delete(:selected)}/)
    options[:class] = "selected #{options[:class]}" if selected
    link_to name, href, options
  end

  def bg(photo_url)
    "background-image: url(#{photo_url});"
  end

  # OPTIMIZE
  # ...didn't really want to add the Filepicker gem just for these two methods
  def filepicker_image_tag(url, image_options = {}, image_tag_options = {})
    image_tag(filepicker_image_url(url, image_options), image_tag_options)
  end

  def filepicker_image_url(url, options = {})
    query_params = options.slice(:w, :h, :fit, :align, :crop, :format, :quality, :watermark, :watersize, :waterposition).to_query
    [url, "/convert?", query_params].join
  end

end
