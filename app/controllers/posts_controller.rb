class PostsController < ApplicationController

  # before_action :move_to_index, except: :index
  # before_action :move_to_index, except: :show
  # before_action :move_to_index, only: %i[index show]
  before_action :move_to_index, only: [:edit, :create, :destroy, :new]

  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def create

             # render plain: params[:post].inspect

            # #セーブする記述
    @post = Post.new(post_params)
      if  @post.save
             # #redirect
        redirect_to posts_path
      else
        render 'new'
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body)

  end

  
end
