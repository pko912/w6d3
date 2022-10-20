class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to comments_url
    end

    def index
        if params[:user_id]
            @comments = Comment.comments_for_user_id(params[:user_id])
        elsif params[:artwork_id]
            @comments = Comment.comments_for_artwork_id(params[:artwork_id])
        else
            @comments = Comment.all
        end
        render json: @comments
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end

end