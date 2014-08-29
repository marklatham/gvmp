namespace :feed do
  desc "Find feed urls"
  task :find => :environment do
    # Find as many feed_urls as Columbus will give us
    Website.all.each do |website|
      website.update_attribute :feed_url, Columbus.new( website.url ).primary.url  rescue nil
    end
    feed_urls =  Website.all.map( &:feed_url ).uniq.compact
    puts 'We have %d feed urls under consideration'.%( feed_urls.size)
  end

  desc "Load posts from feed urls"
  task :load => :environment do
    now = Time.now
    puts  'Task feed:load started [%s]'.%([now])
    # can filter this with "if_modified_since" ==> see Feedzirra docs
    options = {}
    
    website_ids = Ranking.all.map( &:website_id ).uniq.compact
    feed_urls =  Website.where("id in (?)", website_ids).map( &:feed_url ).uniq.compact
    puts 'We have %d feed urls under consideration'.%( feed_urls.size)
    parse_hash = Feedzirra::Feed.fetch_and_parse( feed_urls, options )
    puts '   and %d feed urls parsed'.%( parse_hash.size)
    # File.write( "capture.yml", parse_hash.to_yaml )
    # -- list of feed_urls that Feedzirra could not parse
#     puts '   Feedzirra failed to parse the following urls\n%s\n'.% ([feed_urls -parse_hash.keys])
    # --

    before = Post.count
    parse_hash.each do |k,feed|
      # kind of running backwards here...
      # pull the website out from the feed_url
      website = Website.find_by_feed_url k  rescue next
      unless feed.respond_to? :entries
        puts k
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
  
  desc "Load posts from feed urls of websites in specified communities"
  task :load_by_comm => :environment do
    now = Time.now
    puts  'Task feed:load started [%s]'.%([now])
    # can filter this with "if_modified_since" ==> see Feedzirra docs
    options = {}
    
    comm_ids = [294, 200, 5, 205, 82, 51, 297, 26, 50, 81, 52, 40, 28, 59]
    for comm_id in comm_ids
      community = Community.find(comm_id)
      puts 'Processing community: ' + community.name
      website_ids = Ranking.where("community_id = ?", comm_id).map(&:website_id).uniq.compact
      feed_urls = Website.where("id in (?)", website_ids).map(&:feed_url).uniq.compact
      puts 'We have %d feed urls under consideration'.%( feed_urls.size)
      parse_hash = Feedzirra::Feed.fetch_and_parse( feed_urls, options )
      puts '   and %d feed urls parsed'.%( parse_hash.size)
    # File.write( "capture.yml", parse_hash.to_yaml )
    # -- list of feed_urls that Feedzirra could not parse
    #     puts '   Feedzirra failed to parse the following urls\n%s\n'.% ([feed_urls -parse_hash.keys])
    # --

      before = Post.count
      parse_hash.each do |k,feed|
        # kind of running backwards here...
        # pull the website out from the feed_url
        website = Website.find_by_feed_url k  rescue next
        unless feed.respond_to? :entries
          puts k
          puts '***  feed failed to respond_to? :entries class = %s on site %s'.%([feed.class, website.title])
          puts feed.to_yaml
          next
        end
        Post.add_entries( website, feed.entries )
      end
    end
    puts  '   %5d Post records in total; increased by %d'.%([ Post.count, Post.count - before])
    puts  'Task feed:load done [%0.7s seconds]'.%([Time.now - now])
    puts  '-----'
  end
  
  desc "Load posts from feed urls of specified websites"
  task :load_by_website => :environment do
    now = Time.now
    puts  'Task feed:load started [%s]'.%([now])
    # can filter this with "if_modified_since" ==> see Feedzirra docs
    options = {}
    
    website_ids = Ranking.where("community_id = 59").map(&:website_id).uniq.compact
    for website_id in website_ids
      website = Website.find(website_id)
      puts 'Processing website: ' + website.title
      feed_urls = Website.where("id = ?", website_id).map(&:feed_url)
      puts 'We have %d feed urls under consideration'.%( feed_urls.size)
      parse_hash = Feedzirra::Feed.fetch_and_parse( feed_urls, options )
      puts '   and %d feed urls parsed'.%( parse_hash.size)
    # File.write( "capture.yml", parse_hash.to_yaml )
    # -- list of feed_urls that Feedzirra could not parse
    #     puts '   Feedzirra failed to parse the following urls\n%s\n'.% ([feed_urls -parse_hash.keys])
    # --

      before = Post.count
      parse_hash.each do |k,feed|
        # kind of running backwards here...
        # pull the website out from the feed_url
        website = Website.find_by_feed_url k  rescue next
        unless feed.respond_to? :entries
          puts k
          puts '***  feed failed to respond_to? :entries class = %s on site %s'.%([feed.class, website.title])
          puts feed.to_yaml
          next
        end
        Post.add_entries( website, feed.entries )
      end
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
    
    feed_urls =  Website.where("id = ? OR id = ? OR id = ? OR id = ? OR id = ?", "225", "289", "288", "232", "119").map( &:feed_url ).uniq.compact
    puts 'We have %d feed urls under consideration'.%( feed_urls.size)
    parse_hash = Feedzirra::Feed.fetch_and_parse( feed_urls, options )
    puts '   and %d feed urls parsed'.%( parse_hash.size)
    # File.write( "capture.yml", parse_hash.to_yaml )
    # -- list of feed_urls that Feedzirra could not parse
#     puts '   Feedzirra failed to parse the following urls\n%s\n'.% ([feed_urls -parse_hash.keys])
    # --

    before = Post.count
    parse_hash.each do |k,feed|
      # kind of running backwards here...
      # pull the website out from the feed_url
      website = Website.find_by_feed_url k  rescue next
      unless feed.respond_to? :entries
        puts k
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

  desc "TEST Load posts from feed urls, one website at a time"
  task :load_test => :environment do
    now = Time.now
    puts  'Task feed:load started [%s]'.%([now])
    # can filter this with "if_modified_since" ==> see Feedzirra docs
    options = {}
    
  # fake outdent so don't have to indent code below:
   sites = Website.where("id = ? OR id = ? OR id = ?", "225", "30", "232")
    
   sites.each do |site|
    puts 'website.id = %d'.%(site.id)
    
    feed_urls =  Website.where("id = ?", site.id).map( &:feed_url ).uniq.compact
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
      puts '   %5d feed entries from site %s'.%([feed.entries.size, website.title])
      Post.add_entries( website, feed.entries )
    end
    puts  '   %5d Post records in total; increased by %d'.%([ Post.count, Post.count - before])
    puts  'Task feed:load done [%0.7s seconds]'.%([Time.now - now])
    puts  '-----'
  
   end
  # close the fake outdent above
  end
    
end

