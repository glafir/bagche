module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Return a title on a per-page basis.
  def title
    base_title = "Information Centre."
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

def twitterized_type(type)
 case type
    when :errors
      "alert-error"
    when :alert
      "alert-warning"
    when :error
      "alert-error"
    when :notice
      "alert-success"
    else
      "alert-info"
    end
  end
end
