class BlogPostsController < ApplicationController
    # Helper untuk find by id
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

    def index
        @blog_posts = BlogPost.all
    end

    def show
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        
        # Validation before saving
        if @blog_post.save
            redirect_to @blog_post
        else
            render :new, status: :unprocessable_entity
        end
    end

    # Edit and update
    def edit
    end

    def update
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # Destroy
    def destroy
        @blog_post.destroy

        redirect_to root_path
    end

    private
    
    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end

    def set_blog_post
        @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

end