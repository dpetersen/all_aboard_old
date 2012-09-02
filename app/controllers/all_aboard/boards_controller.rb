class AllAboard::BoardsController < ApplicationController
  layout 'all_aboard/application'

  inherit_resources
  actions :index, :show, :create

  def create
    create! { board_path(@board) }
  end
end
