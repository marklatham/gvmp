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

    before = Post.count
    parse_hash.each do |k,feed|
      # kind of running backwards here...
      # pull the website out from the feed_url
      website = Website.find_by_feed_url k  rescue next
      unless feed.respond_to? :entries
        puts '***  feed failed to respond_to? :entries class = %s on site %s'.%([feed.class, website.title])
        puts feed.to_yaml
        next
      end
#       puts '   %5d feed entries from site %s'.%([feed.entries.size, website.title])
      Post.add_entries( website, feed.entries )
    end
    puts  '   %5d Post records in total; increased by %d'.%([ Post.count, Post.count - before])
    puts  'Task feed:load done [%0.7s seconds]'.%([Time.now - now])
    puts  '-----'
  end
  
  desc "Load a few specified websites' posts from feed urls"
  task :load_few => :environment do
    now = Time.now
    puts  'Task feed:load started [%s]'.%([now])
    # can filter this with "if_modified_since" ==> see Feedzirra docs
    options = {}
    
    feed_urls =  Website.find( :all,
     :conditions => ["id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ? OR id = ?",
                     "225", "30", "232", "31", "221", "223", "222", "239", "226", "35"]
                     ).map( &:feed_url ).uniq.compact
    puts 'We have %d feed urls under consideration'.%( feed_urls.size)
    parse_hash = Feedzirra::Feed.fetch_and_parse( feed_urls, options )
    puts '   and %d feed urls parsed'.%( parse_hash.size)
    
    # -- list of feed_urls that Feedzirra could not parse
#     puts '   Feedzirra failed to parse the following urls\n%s\n'.% ([feed_urls -parse_hash.keys])
    # --

    before = Post.count
    parse_hash.each do |k,feed|
      # kind of running backwards here...
      # pull the website out from the feed_url
      website = Website.find_by_feed_url k  rescue next
      unless feed.respond_to? :entries
        puts '***  feed failed to respond_to? :entries class = %s on site %s'.%([feed.class, website.title])
        puts feed.to_yaml
        next
      end
#       puts '   %5d feed entries from site %s'.%([feed.entries.size, website.title])
      Post.add_entries( website, feed.entries )
    end
    puts  '   %5d Post records in total; %d new'.%([ Post.count, Post.count - before])
    puts  'Task feed:load done [%0.7s seconds]'.%([Time.now - now])
    puts  '-----'
  end
  

  desc "TEST Load posts from feed urls, one website at a time"
  task :load_test => :environment do
    now = Time.now
    puts  'Task feed:load started [%s]'.%([now])
    # can filter this with "if_modified_since" ==> see Feedzirra docs
    options = {}
    
  # fake outdent so don't have to indent code below:
   sites = Website.find(:all)
    
   sites.each do |site|
    puts 'website.id = %d'.%(site.id)
    
    
    feed_urls =  Website.find( :all,
     :conditions => ["id = ?", site.id] ).map( &:feed_url ).uniq.compact
    puts 'We have %d feed urls under consideration'.%( feed_urls.size)
    parse_hash = Feedzirra::Feed.fetch_and_parse( feed_urls, options )
    puts '   and %d feed urls parsed'.%( parse_hash.size)
    
    # -- list of feed_urls that Feedzirra could not parse
#     puts '   Feedzirra failed to parse the following urls\n%s\n'.% ([feed_urls -parse_hash.keys])
    # --

    before = Post.count
    parse_hash.each do |k,feed|
      # kind of running backwards here...
      # pull the website out from the feed_url
      website = Website.find_by_feed_url k  rescue next
      unless feed.respond_to? :entries
        puts '***  feed failed to respond_to? :entries class = %s on site %s'.%([feed.class, website.title])
        puts feed.to_yaml
        next
      end
#       puts '   %5d feed entries from site %s'.%([feed.entries.size, website.title])
      Post.add_entries( website, feed.entries )
    end
    puts  '   %5d Post records in total; %d new'.%([ Post.count, Post.count - before])
    puts  'Task feed:load done [%0.7s seconds]'.%([Time.now - now])
    puts  '-----'
  
   end
  # close the fake outdent above
  end
    
end

