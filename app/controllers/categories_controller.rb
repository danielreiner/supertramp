class CategoriesController < ApplicationController

  respond_to :html, :xml
  #before_filter :login_required

  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all
    @theme = Theme.find(params[:theme_id])


    respond_with @categories
  end

  # GET themes/categories/1
  # GET themes/categories/1.xml
  def show
    @theme = Theme.find(params[:theme_id])
    @category = @theme.categories.find(params[:id])

    respond_with @category

  # @categories = Category.all

  # respond_with @category
  end

  # GET themes/categories/new
  # GET themes/categories/new.xml
  def new
    @theme = Theme.find(params[:theme_id])
    @category = @theme.categories.build

    respond_with @category
  end

  # GET themes/categories/1/edit
  def edit
    @theme = Theme.find(params[:theme_id])
    @category = @theme.categories.find(params[:id])
  end

  # POST themes/categories
  # POST themes/categories.xml
  def create
    @theme = Theme.find(params[:theme_id])
    @category = @theme.categories.build(params[:category])

    if @category.save
      flash[:notice] = "Category was successfully created."
    end

    respond_with @theme
  end

  # PUT themes/categories/1
  # PUT themes/categories/1.xml
  def update
    @theme = Theme.find(params[:theme_id])
    @category = @theme.categories.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
      format.html { redirect_to @theme, notice: 'Category was successfully updated.' }
      format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE themes/categories/1
  # DELETE themes/categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

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