class AllAboard::BoardsController < ApplicationController
  layout "all_aboard/application"

  inherit_resources
  actions :index, :create, :show

  def show
    respond_to do |format|
      format.html { render text: "", layout: "all_aboard/board" }
      format.json { render json: resource, serializer: AllAboard::BoardSerializer }
    end
  end

  def create
    create! { board_path(@board) }
  end
end
