class CommunitySweeper < ActionController::Caching::Sweeper
  observe Community

  def expire_cached_content(community)
    expire_fragment(%r{listing_page_*})

    # TODO
    # expire record
  end

  alias_method :after_save,    :expire_cached_content
  alias_method :after_destroy, :expire_cached_content

end
