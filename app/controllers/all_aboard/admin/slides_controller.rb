module AllAboard::Admin
  class SlidesController < AdminController
    inherit_resources
    belongs_to :board, parent_class: AllAboard::Board
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
end
