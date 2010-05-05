class Ballot
  attr_reader :clicks

  def initialize
    @clicks = []
  end

  def add_vote(vote)
    @clicks << vote
  end

# This destroys the vote in the session and then in the database.
# @clicks are the votes that are saved in this browser session.
  def destroy_click(c_id, w_id)
    for click in @clicks
      if click.community_id == c_id && click.website_id == w_id
        @clicks.delete(click)
        click.destroy
      end
    end
  end

end