class ImagePostsController < ApplicationController
  before_action :check_authentication, except: :index
  before_action :check_edit, except: [:index, :show]
  before_action :set_image_post, only: [:show, :edit, :update, :destroy]

  # GET /image_posts
  # GET /image_posts.json
  def index
    @image_posts = ImagePost.all
  end

  # GET /image_posts/1
  # GET /image_posts/1.json
  def show
  end

  def check_edit
    render_error unless ImagePost.edit_by?(@current_user)
  end

  # GET /image_posts/new
  def new
    @news_post = NewsPost.find(params[:postid])
    @image_post = ImagePost.new(news_post: @news_post)
  end

  # GET /image_posts/1/edit
  def edit
  end

  # POST /image_posts
  # POST /image_posts.json
  def create
    @image_post = ImagePost.new(image_post_params)
    respond_to do |format|

      if @image_post.save
        format.html { redirect_to @image_post.news_post, notice: 'Изображение успешно создано.' }
        format.json { render :show, status: :created, location: @image_post }
      else
        format.html { render :new }
        format.json { render json: @image_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_posts/1
  # PATCH/PUT /image_posts/1.json
  def update
    respond_to do |format|
      if @image_post.update(image_post_params)
        format.html { redirect_to @image_post.news_post, notice: 'Изображение успешно обновлено.' }
        format.json { render :show, status: :ok, location: @image_post }
      else
        format.html { render :edit }
        format.json { render json: @image_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_posts/1
  # DELETE /image_posts/1.json
  def destroy
    @image_post.destroy
    respond_to do |format|
      format.html { redirect_to news_post_url(@image_post.news_post), notice: 'Изображение успешно удалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_post
      @image_post = ImagePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_post_params
      params.require(:image_post).permit(:image, :news_post_id)
    end
end
