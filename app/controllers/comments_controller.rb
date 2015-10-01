class CommentsController < ApplicationController
  
  def create_comment
    unless find_commentable.comments.build(comment_params.merge user_id: session[:user_id]).save
      
    end
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content)

  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end




