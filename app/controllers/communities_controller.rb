class CommunitiesController < ApplicationController
  # GET /communities
  # GET /communities.xml
  def index
    @communities = Community.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @communities }
    end
  end

  # GET /communities/1
  # GET /communities/1.xml
  def show
    @community = Community.find(params[:id])
    @websites = @community.rankings.with_websites

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @community }
    end
  end

  def vote_for_website
    @ip = request.remote_ip
    @website = Website.find(params[:id])
    @community = Community.find(params[:community])
    
    Vote.create!({:ip_address => @ip, :community_id => @community.id, :website_id => @website.id})
    
    website_rank_in_community = Ranking.find(:first, :conditions => ["community_id = ? and website_id = ?", @community, @website])
    website_rank_in_community.rerank
    
    redirect_to :action => :show, :id => @community
  end
  
  # GET /communities/new
  # GET /communities/new.xml
  def new
    @community = Community.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @community }
    end
  end

  # GET /communities/1/edit
  def edit
    @community = Community.find(params[:id])
  end

  # POST /communities
  # POST /communities.xml
  def create
    @community = Community.new(params[:community])

    respond_to do |format|
      if @community.save
        flash[:notice] = 'Community was successfully created.'
        format.html { redirect_to(@community) }
        format.xml  { render :xml => @community, :status => :created, :location => @community }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @community.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /communities/1
  # PUT /communities/1.xml
  def update
    @community = Community.find(params[:id])

    respond_to do |format|
      if @community.update_attributes(params[:community])
        flash[:notice] = 'Community was successfully updated.'
        format.html { redirect_to(@community) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @community.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.xml
  def destroy
    @community = Community.find(params[:id])
    @community.destroy

    respond_to do |format|
      format.html { redirect_to(communities_url) }
      format.xml  { head :ok }
    end
  end
end
