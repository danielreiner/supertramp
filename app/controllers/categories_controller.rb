class CategoriesController < ApplicationController

  respond_to :html, :xml
  #before_filter :login_required

  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all

    respond_with @categories
  end

  # GET themes/cards/categories/1
  # GET themes/cards/categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_with @category

  # @categories = Category.all

  # respond_with @category
  end

  # GET themes/cards/categories/new
  # GET themes/cards/categories/new.xml
  def new
    @category = Category.new

    respond_with @category
  end

  # GET themes/cards/categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST themes/cards/categories
  # POST themes/cards/categories.xml
  def create
    @category = Category.new(params[:category])

    if @category.save
      flash[:notice] = "Category was successfully created."
    end

    respond_with @category
  end

  # PUT themes/cards/categories/1
  # PUT themes/cards/categories/1.xml
  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      flash[:notice] = "Category was successfully updated."
    end

    respond_with @category
  end

  # DELETE themes/cards/categories/1
  # DELETE themes/cards/categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_with @category
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