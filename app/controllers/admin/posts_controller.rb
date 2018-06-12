class Admin::PostsController < Admin::BaseController

  def index
    @posts = Post.unscoped
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create post_params
    if @post.save
      flash[:success] = "Post created successfully."
      redirect_to admin_posts_path
    else
      render action: "new"
    end
  end

  def edit
    @post = Post.unscoped.find params[:id]
  end

  def update
    @post = Post.unscoped.find params[:id]
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated successfully."
      redirect_to admin_posts_path
    else
      render action: "edit"
    end
  end

  def destroy
    @post = Post.unscoped.find(params[:id]).destroy
    flash[:success] = "Post destroyed successfully."
    redirect_to admin_posts_path
  end

private

  def post_params
    params.require(:post).permit(:author_id, :title, :slug, :body, :abstract, :meta_description, :meta_keywords, :enabled, :filepicker_url)
  end

end
