class Api::PostsController < Api::BaseController
  before_action :set_post, only: [:show, :update, :destroy] 
  before_action :authorize_post, only: [:show, :update, :destroy]

  def index
    @posts = @user.posts
    @user.requests.create(method: :get, requestable_type: "Post")
  end

  def show
    @user.requests.create(method: :get, requestable_type: "Post")
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      render :show, status: :created
    else
      render json: { message: @post.errors.full_messages }, status: :unprocessable_entity
    end
    @user.requests.create(method: :post, requestable_type: "Post")
  end

  def update
    if @post.update(post_params)
      render :show, status: :ok
    else
      render json: { message: @post.errors.full_messages }, status: :unprocessable_entity
    end
    @user.requests.create(method: :put, requestable_type: "Post")
  end

  def destroy
    @post.destroy
    render :show, status: :ok
    @user.requests.create(method: :delete, requestable_type: "Post")
  end 
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_post
    render json: { message: "Unauthorized" }, status: :unauthorized unless @user == @post.user
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
