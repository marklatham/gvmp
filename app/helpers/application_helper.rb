# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_url?(string)
    string.slice(0, 4) == "http" and 
    string.include?("://") and 
    string.include?(".")
  end

  def link_if_url(string)
    link_to_if is_url?(string), string, string, :target => "_blank"
  end

  def link_separator(s = '|')
    content_tag(:span, s, :class => 'separator')
  end
end
