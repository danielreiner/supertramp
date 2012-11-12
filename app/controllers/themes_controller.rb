class ThemesController < ApplicationController

  respond_to :html, :xml

  #before_filter :authenticate_user!
  #before_filter :login_required

  # GET /themes
  # GET /themes.xml
  def index
    @themes = Theme.all

    respond_with @themes
  end

  # GET /themes/1
  # GET /themes/1.xml
  def show
    @theme = Theme.find(params[:id])

    respond_with @theme

  # @cards = Card.all

  # respond_with @card
  end

  # GET /themes/new
  # GET /themes/new.xml
  def new
    @theme = Theme.new
  # @theme.user_id = current_user


    respond_with @theme
  end

  # GET /themes/1/edit
  def edit
    @theme = Theme.find(params[:id])
  end

  # POST /themes
  # POST /themes.xml
  def create
    @theme = Theme.new(params[:theme])

    if @theme.save
      flash[:notice] = "Theme was successfully created."
    end

    respond_with @theme
  end

  # PUT /themes/1
  # PUT /themes/1.xml
  def update
    @theme = Theme.find(params[:id])

    if @theme.update_attributes(params[:theme])
      flash[:notice] = "Theme was successfully updated."
    end

    respond_with @theme
  end

  # DELETE /themes/1
  # DELETE /themes/1.xml
  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy

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