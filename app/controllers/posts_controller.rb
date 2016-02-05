class PostsController < ApplicationController
  include PostsHelper

  def index
  	#byebug
  	if (params[:sort])
  		@posts = Post.order(params[:sort].to_sym)
  		render json: {}
  	else
  		@posts = Post.all
  	end
  end

  def high_rated_index
  	#byebug
  	if (!params[:sort].nil?)
  		@posts = Post.order(params[:sort].to_sym)
      # render :home
  		#render json: {partial: render :partial => "partials/list"}
  		# render js: {}
      # render json: {status: 200}
  	else
  	 @posts = Post.where("votes > '4'")

  	end
    render :home
  end

  def low_rated_index
  	@posts = Post.where("votes < '5'")
  end

  def show
  	@post = Post.find params[:id]
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new post_params
  	@post.save
  	flash.notice = "Post '#{@post.title}' Created!"
  	redirect_to post_path(@post)
  end


  def sort_by_date
  	@posts = Post.order(:created_at)
  end

  def sort_by_votes
  	@posts = Post.order(:votes)
  end




end
