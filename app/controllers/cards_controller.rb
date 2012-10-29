class CardsController < ApplicationController

  respond_to :html, :xml
  #before_filter :login_required

  # GET /cards
  # GET /cards.xml
  def index
    @cards = Card.all

    respond_with @cards
  end

  # GET themes/cards/1
  # GET themes/cards/1.xml
  def show
    @card = Card.find(params[:id])

    respond_with @card

  # @cards = Card.all

  # respond_with @card
  end

  # GET themes/cards/new
  # GET themes/cards/new.xml
  def new
    @card = Card.new

    respond_with @card
  end

  # GET themes/cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST themes/cards
  # POST themes/cards.xml
  def create
    @card = Card.new(params[:card])

    if @card.save
      flash[:notice] = "Card was successfully created."
    end

    respond_with @card
  end

  # PUT themes/cards/1
  # PUT themes/cards/1.xml
  def update
    @card = Card.find(params[:id])

    if @card.update_attributes(params[:card])
      flash[:notice] = "Card was successfully updated."
    end

    respond_with @card
  end

  # DELETE themes/cards/1
  # DELETE themes/cards/1.xml
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_with @card
  end


 # def toggle_close
 #   if current_user.admin?
 #     discussion = ForumDiscussion.find(params[:id])
 #     if discussion.closed?
 #       discussion.reopen!
 #       flash[:success] = "Diskussion '#{discussion.subject}' wurde wieder geöffnet."
 #     elsif discussion.published?
 #       discussion.close!
 #       flash[:success] = "Diskussion '#{discussion.subject}' wurde geschlossen."
 #     end
 #   else
 #     flash[:warning] = "Diskussion '#{discussion.subject}' darfst Du nicht schliessen."
 #   end
 #   redirect_to :back
 # end

  
  #def set_title
   # @title = "#{I18n.t(:game)}-Forum: "
#    @description = "Im Sauspiel Forum tauschen sich die Schafkopfer über die besten Spielstrategien und ihre schönsten Spiele aus, oder ratschen miteinander."
 # end
  
  #load_namespaced_extensions

end