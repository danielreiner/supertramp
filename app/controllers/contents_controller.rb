class ContentsController < ApplicationController

  respond_to :html, :xml
  before_filter :authenticate_user!
  
  #before_filter :login_required

  # GET /contents
  # GET /contents.xml
  def index
    @contents = Content.all

    respond_with @contents
  end

  # GET themes/contents/1
  # GET themes/contents/1.xml
  def show
    @content = Content.find(params[:id])

    respond_with @content

  # @contents = Content.all

  # respond_with @content
  end

  # GET themes/contents/new
  # GET themes/contents/new.xml
  def new
    @theme = Theme.find(params[:theme_id])
    @card = Card.find(params[:card_id])
    @content = @card.contents.build

    respond_with @content
  end

  # GET themes/contents/1/edit
  def edit
    @theme = Theme.find(params[:theme_id])
    @content = @theme.contents.find(params[:id])
  end

  # POST themes/contents
  # POST themes/contents.xml
  def create
    @card = Card.find(params[:card_id])
    @content = @card.contents.build(params[:content])
    @content.user_id = current_user

    if @content.save
      flash[:notice] = "Content was successfully created."
    end

    respond_with @card
  end

  # PUT themes/contents/1
  # PUT themes/contents/1.xml
  def update
    @content = Content.find(params[:id])


    if @content.update_attributes(@content)
      format.html { redirect_to [@theme, @content], notice: 'Content was successfully updated.' }
    end

  end

  # DELETE themes/contents/1
  # DELETE themes/contents/1.xml
  def destroy
    @content = Content.find(params[:id])
    @content.destroy

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
