class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render json: { message: 'Post was successfully destroyed.' }, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
  params.require(:post).permit(:title, :body)
  end
end
