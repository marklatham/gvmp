class Ballot
  attr_reader :clicks

  def initialize
    @clicks = []
  end

  def add_vote(vote)
    @clicks << vote
  end

# This deletes superseded votes in the session and then destroys them in the database.
# @clicks are the votes that are saved in this browser session.
  def destroy_click(c_id, w_id)
    for click in @clicks
      if click.community_id == c_id && click.website_id == w_id
        @clicks.delete(click) # Does this delete too many clicks? Refresh browser to see the problem.
        # click.destroy # I think this was causing occasional deletes of votes from previous day.
      end
    end
  end

end