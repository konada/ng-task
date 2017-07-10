class CommentsController < ApplicationController
before_action :find_movie, except: [:destroy]
before_action :authenticate_user!

    def new
      @comment = Comment.new
    end

    def create
      @comment = @movie.comments.new(comment_params)

      if @comment.save
        redirect_to request.referer, notice: 'Your comment was successfully posted!'
      else
        redirect_to request.referer, notice: "Your comment wasn't posted!"
      end
    end

    def destroy
      Comment.find(params[:id]).destroy
      redirect_to request.referer, notice: 'Your comment was successfully destroyed!'
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end

    def find_movie
      @movie = Movie.find(params[:movie_id])
    end
end
