module CommunitiesHelper
  def render_community(community)
    link_to(community.name, community)
  end

  def render_category(community)
    h community.category
  end

  def render_location(community, area=nil)
    if area.nil?
      location = [:city, :prov_state, :country].inject([]) { |l, f| l << community.send(f) }
      location.reject{|i| i.blank?}.join(', ')
    else
      h truncate(community.send(area), :length => 15)
    end
  end

  def render_scope(community, length = 20)
    h truncate(community.scope, length)
  end

  def render_websites_count(community)
    # TODO: Cache the websites count
    number_with_delimiter(community.websites.count)
  end


  def render_community_actions(community)
    return unless current_user

    text = ''
    if current_user.permission >= 4.0
      text << content_tag(:span, link_to('Edit', edit_community_path(community)), :class => 'permission')
    end

    if current_user.permission >= 7.0
      text << ' '
      text << content_tag(:span, link_to('Destroy', community, :confirm => 'Are you sure?', :method => :delete), :class => 'permission')
    end

    content_tag(:td, text, :class => 'actions')
  end

end
