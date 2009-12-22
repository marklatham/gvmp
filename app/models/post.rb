class Post < ActiveRecord::Base
  belongs_to :website

  private
  
  def self.add_entries(website, entries)
    entries.each do |entry|
      entry.sanitize!

      create!(
        :website    => website,
        :headline   => entry.title,
        :body       => entry.content,
        :summary    => entry.summary,
        :url        => entry.url,
        :posted_at  => entry.published,
        :guid       => entry.id
      ) unless exists? :guid => entry.id

    end
  end

end

