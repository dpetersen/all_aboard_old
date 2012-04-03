module AllAboard::Admin
  class BoardsController < AdminController
    inherit_resources
    actions :index, :new, :create, :show

    def create
      create! do |success, failure|
        success.html { redirect_to admin_boards_path }
      end
    end
  end
end
