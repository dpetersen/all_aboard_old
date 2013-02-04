class AllAboard::SlidesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    params[:slide][:layout_name] = params[:slide][:layout_id]

    slide = AllAboard::Slide.new(params[:slide])
    slide.assign_to_board(board)
    slide.save
    render json: slide, serializer: AllAboard::SlideSerializer
  end

protected

  def board
    AllAboard::Board.find(params[:slide][:board_id])
  end
end
