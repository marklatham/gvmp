namespace :feed do

  desc "Update feed headlines from each of the websites"
  task :update => :environment do

    require 'columbus'
    require 'feedzirra'

	# this is a bit of a mess, as the websites are duplicated ...
    Website.find( :all ).each do |website|
      website.feed_url ||= Columbus.new( website.url ).primary.url  rescue nil
	website.save if website.feed_url
	next if website.feed_url.nil?
     #puts website.feed_url
	# found the feed_url -- get the posts
    feed = Feedzirra::Feed.fetch_and_parse( website.feed_url ) || []

	# here, a rough mapping between the Post attributes and those provided via feedzilla

	feed.entries.each do |entry|
	  entry.sanitize!
	  Post.create  :website => website, 
	    :headline => entry.title,
	    :url => entry.url,
	    :body => entry.content,
	    :posted_at => entry.published

	end

    end 


end



end
