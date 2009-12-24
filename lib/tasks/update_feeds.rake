namespace :feed do
  desc "Find feed urls"
  task :find => :environment do
    # Find as many feed_urls as Columbus will give us
    Website.find( :all ).each do |website|
      website.update_attribute :feed_url, Columbus.new( website.url ).primary.url  rescue nil
    end
    feed_urls =  Website.find( :all ).map( &:feed_url ).uniq.compact
    puts 'We have %d feed urls under consideration'.%( feed_urls.size)
  end

  desc "Load posts from feed urls"
  task :load => :environment do
    now = Time.now
    puts  'Task feed:load started [%s]'.%([now])
    # can filter this with "if_modified_since" ==> see Feedzirra docs
    options = {}
    
    feed_urls =  Website.find( :all ).map( &:feed_url ).uniq.compact
    puts 'We have %d feed urls under consideration'.%( feed_urls.size)
    parse_hash = Feedzirra::Feed.fetch_and_parse( feed_urls, options )
    puts '   and %d feed urls parsed'.%( parse_hash.size)
    
    # -- list of feed_urls that Feedzirra could not parse
#     puts '   Feedzirra failed to parse the following urls\n%s\n'.% ([feed_urls -parse_hash.keys])
    # --
    
    parse_hash.each do |k,feed|
      # kind of running backwards here...
      # pull the website out from the feed_url
      website = Website.find_by_feed_url k  rescue next
      unless feed.respond_to? :entries
        puts '***  feed failed to respond_to? :entries class = %s'.%([feed.class])
        next
      end
      puts '   %5d feed entries from site %d'.%([feed.entries.size, website.id])
      Post.add_entries( website, feed.entries )
    end
    puts  '   %5d Post records in total'.%([ Post.count])
    puts  'Task feed:load done [%s seconds]'.%([Time.now - now])
    puts  '-----'
  end
  
  
end

