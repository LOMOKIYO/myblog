class PostsController < ApplicationController
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
    private
    def post_params
      params.require(:post).permit(:title, :body)
    end
  

end
