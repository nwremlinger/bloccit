class Topics::PostsController < ApplicationController
  
  
  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comment = @post.comments #Comment.where(post_id: params[:id])
    authorize @topic
  end

  def new 
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
     @post = current_user.posts.build(post_params)
    @post.topic = @topic  
      authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title,:body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    title = @post.title

    authorize @post
    if @post.destroy
      flash[:notice] = "Post \"#{title}\" was successfully deleted."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting this post."
      render :show
    end
  end

  private

def post_params
  params.require(:post).permit(:title, :body)
end

end