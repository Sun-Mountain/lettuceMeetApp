class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authorize_post, only: [:show, :update, :destroy]

  def index
    @posts = @user.posts
  end

  def show
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      render :show, status: :created
    else
      render json: { message: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render :show, status: :ok
    else
      render json: { message: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render :show, status: :ok
  end 
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_post
    render json: { message: "Unauthorized" }, status: :unauthorized unless @user == @post.user
  end
end
