class Ballot
  attr_reader :clicks

  def initialize
    @clicks = []
  end

  def add_vote(vote)
    @clicks << vote
  end

# This destroys the vote in database, but how to destroy vote stored in session?
  def destroy_click(c_id, w_id)
    for click in @clicks
      if click.community_id == c_id && click.website_id == w_id
        click.destroy
      end
    end
  end

end