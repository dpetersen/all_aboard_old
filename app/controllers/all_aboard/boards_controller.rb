class AllAboard::BoardsController < ApplicationController
  layout 'all_aboard/application'

  skip_before_filter :verify_authenticity_token
  inherit_resources
  actions :create

  def index
    respond_to do |format|
      # When a user hits this route directly, we want to render the main Ember app...
      format.html {}
      # ... but still let them fetch the boards list JSON.
      format.json { render json: collection, each_serializer: AllAboard::BoardSerializer }
    end
  end

  def show
    respond_to do |format|
      format.html { render :index }
      format.json { render json: resource, serializer: AllAboard::BoardSerializer }
    end
  end

  def create
    create! do |format|
      format.json { render json: resource, serializer: AllAboard::BoardSerializer }
    end
  end
end
