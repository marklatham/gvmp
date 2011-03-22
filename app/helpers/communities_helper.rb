module CommunitiesHelper
  def render_community(community)
    link_to(community.name, "/" + community.idstring)
    # link_to(community.name, community)
  end

  def render_category(community)
    h community.category
  end

  def render_location(community, area=nil)
    if area.nil?
      location = [:city, :prov_state, :country].inject([]) { |l, f| l << community.send(f) }
      location.reject{|i| i.blank?}.join(', ')
    else
      h truncate(community.send(area), :length => 30)
    end
  end

  def render_scope(community, length = 20)
    h truncate(community.scope, :length => length)
  end

  def render_websites_count(community)
    number_with_delimiter(community.n_websites)
  end

  def render_datetime(dt, format)
    I18n.l dt, :format => format
  end

end
