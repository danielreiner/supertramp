class CardsController < ApplicationController

  respond_to :html, :xml
  before_filter :authenticate_user!
  #before_filter :login_required

  # GET /cards
  # GET /cards.xml
  def index
    @cards = Card.all
    @theme = Theme.find(params[:theme_id])


    respond_with @cards
  end

  # GET themes/cards/1
  # GET themes/cards/1.xml
  def show
    @theme = Theme.find(params[:theme_id])
    @card = @theme.cards.find(params[:id])

    respond_with @card

  # @cards = Card.all

  # respond_with @card
  end

  # GET themes/cards/new
  # GET themes/cards/new.xml
  def new
    @theme = Theme.find(params[:theme_id])
    @card = @theme.cards.build

    respond_with @card
  end

  # GET themes/cards/1/edit
  def edit
    @theme = Theme.find(params[:theme_id])
    @card = @theme.cards.find(params[:id])
  end

  # POST themes/cards
  # POST themes/cards.xml
  def create
    @theme = Theme.find(params[:theme_id])
    @card = @theme.cards.build(params[:card])
    @card.user_id = current_user

    if @card.save
      flash[:notice] = "Card was successfully created."
    end

    respond_with @theme
  end

  # PUT themes/cards/1
  # PUT themes/cards/1.xml
  def update
    @theme = Theme.find(params[:theme_id])
    @card = @theme.cards.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
      format.html { redirect_to @theme, notice: 'Card was successfully updated.' }
      format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end


    # def update
    # @gallery = Gallery.find(params[:gallery_id])
    # @photo = Photo.find(params[:id])
    # 
    # respond_to do |format|
    # if @photo.update_attributes(params[:photo])
      # format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
      # format.json { head :ok }
    # else
      # format.html { render action: "edit" }
      # format.json { render json: @photo.errors, status: :unprocessable_entity }
    # end

  end

  # DELETE themes/cards/1
  # DELETE themes/cards/1.xml
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_with @theme
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