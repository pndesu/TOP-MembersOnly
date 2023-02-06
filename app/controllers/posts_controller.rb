class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index

    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.author = User.find_by_id(current_user.id).username
        if @post.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :content).merge(user: current_user)
    end
end
