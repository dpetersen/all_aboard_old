class AllAboard::Admin::PerspectiveAssignmentsController < ApplicationController
  inherit_resources
  belongs_to :board, parent_class: AllAboard::Board
  belongs_to :slide, parent_class: AllAboard::Slide
  actions :create

  def create
    create! do |success, failure|
      success.html { redirect_to edit_admin_board_slide_path(@board, @slide) }
    end
  end
end
