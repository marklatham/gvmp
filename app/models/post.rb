class Post < ActiveRecord::Base
  belongs_to :website

  private
  
  def self.add_entries(website, entries)
    entries.each do |entry|
      entry.sanitize! rescue nil

      create!(
        :website    => website,
        :headline   => entry.title,
        :body       => entry.content,
        :summary    => entry.summary,
        :url        => entry.url,
        :posted_at  => entry.published,
        :guid       => entry.id
      ) unless exists? :guid => entry.id  rescue next

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

