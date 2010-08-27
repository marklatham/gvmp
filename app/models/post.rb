class Post < ActiveRecord::Base
  belongs_to :website

  private
  
  def self.add_entries(website, entries)
    
    # Only save posts newer than what we already have. If we have none, save those newer than 2009-01-01.
    latest = Post.find(:first, :conditions => ["website_id = ?", website.id], :order => "posted_at DESC")
    cutoff = Time.parse("2009-01-01 16:57:45.608000 -04:00")
    cutoff = latest.posted_at if latest
    timestamp = Time.now
    
    entries.each do |entry|
      entry.sanitize! rescue nil
      unless entry.published # If there's no published datetime, create them in reverse order:
        create!(
          :website    => website,
          :headline   => entry.title,
          :body       => entry.content,
          :summary    => entry.summary,
          :url        => entry.url,
          :posted_at  => timestamp,
          :guid       => entry.id)
        timestamp = 1.second.ago(timestamp)
      end
      create!(
        :website    => website,
        :headline   => entry.title,
        :body       => entry.content,
        :summary    => entry.summary,
        :url        => entry.url,
        :posted_at  => entry.published,
        :guid       => entry.id
      ) if entry.published > cutoff  rescue next
#      ) unless exists? :guid => entry.id  rescue next

    end
    
#   Delete all but latest 5 posts for this website:

    to_delete = Post.find(:all, :conditions => ["website_id = ?", website.id], :order => "posted_at DESC")

    count = 0
    to_delete.each do |post|
      count += 1
      post.delete if count > 5
    end

  end

end

