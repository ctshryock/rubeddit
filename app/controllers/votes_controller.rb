class VotesController < ApplicationController
  def create
    @link = Link.find(params[:quote_id])
    
    respond_to do |format|
      if current_user.vote(@link, params[:vote])
        format.rjs  { render :action => "create", :vote => @vote }
        format.html { redirect_to([@link.user, @link]) }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.rjs  { render :action => "error" }
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end


  def show
    @link = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vote }
    end
  end
end