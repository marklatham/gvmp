namespace :feed do
  desc "Find feed urls"
  task :find => :environment do
    # Find as many feed_urls as Columbus will give us
    Website.find( :all ).each do |website|
      website.update_attribute :feed_url, Columbus.new( website.url ).primary.url  rescue nil
    end
  end

  desc "Load posts from feed urls"
  task :load => :environment do

    # can filter this with "if_modified_since" ==> see Feedzirra docs
    options = {}
    
    feed_urls =  Website.find( :all ).map( &:feed_url ).uniq.compact
    parse_hash = Feedzirra::Feed.fetch_and_parse( feed_urls, options )

    # -- list of feed_urls that Feedzirra could not parse
    #   feed_urls -parse_hash.keys
    # --
    
    parse_hash.each do |k,feed|
      # kind of running backwards here...
      # pull the website out from the feed_url
      website = Website.find_by_feed_url k
      Post.add_entries( website, feed.entries )
    end
  end
  
  
end

