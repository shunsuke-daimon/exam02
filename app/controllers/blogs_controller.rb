class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end
    
    def new
        if params[:back]
            @blog = Blog.new
        else
            @blog = Blog.new
        end
    end
    
    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            redirect_to blogs_path,notice:"作成しました！"
        else
            render'new'
        end
    end
    
    def confirm
        @blog = Blog.new(blog_params)
        render :new if @blog.invalid?
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            redirect_to blogs_path,notice:"編集しました！"
        else
            render 'edit'
        end
    end
    
    def destroy
        @blog =Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path,notice:"削除しました。"
    end
    
    private
    def blog_params
        params.require(:blog).permit(:name,:title,:content)
    end
end
