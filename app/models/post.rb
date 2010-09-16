class Post < ActiveRecord::Base
  belongs_to :website

  private
  
  def self.add_entries(website, entries)
    
    # Only save posts newer than what we already have. If we have none, save those newer than 2009-01-01.
    latest = Post.find(:first, :conditions => ["website_id = ?", website.id], :order => "posted_at DESC")
    cutoff = Time.parse("2009-01-01 16:57:45.608000 -04:00")
    cutoff = latest.posted_at if latest
    timestamp = Time.now
    has_dates = true
    
    entries.each do |entry|
      entry.sanitize! rescue nil
      entry.url = entry.id unless entry.url # In rare cases when entry.url is NULL, use entry.id
      
      entry.summary = "" unless entry.summary
      entry.content = "" unless entry.content
      if entry.summary.length > entry.content.length
        show_text = entry.summary
      else
        show_text = entry.content
      end
      
      unless entry.published # If there's no published datetime, create timestamps in reverse order:
        has_dates = false
        unless Post.find(:first, :conditions => ["website_id = ? and guid = ?", website.id, entry.id])
          create!(
            :website    => website,
            :headline   => entry.title,
            :body       => entry.content,
            :summary    => entry.summary,
            :url        => entry.url,
            :posted_at  => timestamp,
            :guid       => entry.id,
            :show_text  => show_text)
          timestamp = 1.minute.ago(timestamp)
        end
      end
      create!(
        :website    => website,
        :headline   => entry.title,
        :body       => entry.content,
        :summary    => entry.summary,
        :url        => entry.url,
        :posted_at  => entry.published,
        :guid       => entry.id,
        :show_text  => show_text
      ) if entry.published.in_time_zone('UTC') > 1.second.from_now(cutoff.in_time_zone('UTC'))  rescue next
#      ) unless exists? :guid => entry.id  rescue next

    end
    
    to_delete = Post.find(:all, :conditions => ["website_id = ?", website.id], :order => "posted_at DESC")
    if has_dates # Delete all but latest 5 posts for this website:
      count = 0
      to_delete.each do |post|
        count += 1
        post.delete if count > 5
      end
    else # If no dates then delete posts that are no longer in the current feed:
      to_delete.each do |post|
        delete_this_post = true
        entries.each do |entry|
          delete_this_post = false if entry.id == post.guid
        end
        post.delete if delete_this_post
      end
    end
    
  end

end

