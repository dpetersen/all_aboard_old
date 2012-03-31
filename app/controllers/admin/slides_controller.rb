class Admin::SlidesController < ApplicationController
  inherit_resources
  belongs_to :board
  actions :create, :edit, :update

  def create
    create! do |success, failure|
      success.html { redirect_to edit_admin_board_slide_path(@board, @slide) }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to edit_admin_board_slide_path(@board, @slide) }
    end
  end
end
