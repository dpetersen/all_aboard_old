class AllAboard::BoardsController < ApplicationController
  layout 'all_aboard/application'

  inherit_resources
  actions :create

  def index
    respond_to do |format|
      format.html {}
      format.json { render json: collection, each_serializer: AllAboard::BoardSerializer }
    end
  end

  def show
    respond_to do |format|
      # When a user hits this route directly, we want to render the main Ember app...
      format.html { render :index }
      # ... but still let them fetch the individual record.
      format.json { render json: resource, serializer: AllAboard::BoardSerializer }
    end
  end

  def create
    create! { board_path(@board) }
  end
end
