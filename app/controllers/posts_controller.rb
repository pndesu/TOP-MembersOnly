class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index

    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end
end
