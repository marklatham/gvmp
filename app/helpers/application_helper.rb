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

  # TODO use alias_method
  def paginate(collection)
    will_paginate(collection)
  end

  def flash_notice
    html = if flash[:success]
      content_tag(:div, flash[:success], :class => :success)
    elsif flash[:error]
      content_tag(:div, flash[:error], :class => :error)
    elsif flash[:info]
      content_tag(:div, flash[:info], :class => :info)
    elsif flash[:warning]
      content_tag(:div, flash[:warning], :class => :warning)
    end

    flash.discard
    html
  end



end
