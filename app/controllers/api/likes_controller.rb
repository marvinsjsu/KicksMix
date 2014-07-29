class Api::LikesController < ApplicationController

  def create
    @shoe = Shoe.find(params[:shoe_id])
    @shoe.likes.build({user_id: get_current_user.id })

    if @shoe.save
      @shoe
    else
      @shoe.errors
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end
end