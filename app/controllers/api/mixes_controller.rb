class Api::MixesController < ApplicationController

  def index
    @shoe = Shoe.find(params[:shoe_id])
    @shoe
  end

  def create
    @shoe = Shoe.find(params[:shoe_id])
    @shoe.matching_items.build(mixes_params)

    if @shoe.save
      @shoe
    else
      @shoe.errors
    end
  end

  def destroy
    @mix = Mix.find(params[:id])
    @mix.destroy
  end

  private

  def mixes_params
    params.require(:mixes).permit(:user_id, :shoe_id, :description, :mix_photo, :mix_photo_file_name, :mix_photo_content_type, :mix_photo_file_size, :mix_photo_updated_at)
  end

end