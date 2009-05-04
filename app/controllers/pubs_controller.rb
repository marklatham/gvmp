class PubsController < ApplicationController
  # GET /pubs
  # GET /pubs.xml
  def index
    @pubs = Pub.find(:all, :order => "date_sequence DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pubs }
    end
  end

  # GET /pubs/1
  # GET /pubs/1.xml
  def show
    @pub = Pub.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pub }
    end
  end

  # GET /pubs/new
  # GET /pubs/new.xml
  def new
    @pub = Pub.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pub }
    end
  end

  # GET /pubs/1/edit
  def edit
    @pub = Pub.find(params[:id])
  end

  # POST /pubs
  # POST /pubs.xml
  def create
    @pub = Pub.new(params[:pub])

    respond_to do |format|
      if @pub.save
        flash[:notice] = 'Pub was successfully created.'
        format.html { redirect_to(publications_url) }
        format.xml  { render :xml => @pub, :status => :created, :location => @pub }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pub.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pubs/1
  # PUT /pubs/1.xml
  def update
    @pub = Pub.find(params[:id])

    respond_to do |format|
      if @pub.update_attributes(params[:pub])
        flash[:notice] = 'Pub was successfully updated.'
        format.html { redirect_to(publications_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pub.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pubs/1
  # DELETE /pubs/1.xml
  def destroy
    @pub = Pub.find(params[:id])
    @pub.destroy

    respond_to do |format|
      format.html { redirect_to(pubs_url) }
      format.xml  { head :ok }
    end
  end
end
