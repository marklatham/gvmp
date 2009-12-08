module CommunitiesHelper
  def render_community(community)
    link_to(community.name, community)
  end

  def render_category(community)
    community.category
  end

  def render_location(community)
    location = [:city, :prov_state, :country].inject([]) { |l, f| l << community.send(f) }
    location.reject{|i| i.blank?}.join(', ')
  end

  def render_scope(community, length = 20)
    h truncate(community.scope, length)
  end

  def render_websites_info(community)
    number_with_delimiter(community.websites.count)
  end

  def render_community_actions(community)
    return unless current_user

    text = ''
    if current_user.permission >= 4.0
      text << content_tag(:span, link_to('Edit', edit_community_path(community)), :class => 'item')
    end

    if current_user.permission >= 7.0
      text << content_tag(:span, link_to('Destroy', community, :confirm => 'Are you sure?', :method => :delete), :class => 'last')
    end

    content_tag(:div, text, :class => 'actions')
  end

end
