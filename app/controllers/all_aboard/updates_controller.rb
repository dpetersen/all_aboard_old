class AllAboard::UpdatesController < ApplicationController
  def index
    render json: {
      updates: AllAboard::Update.since(params[:since]),
      latest_timestamp: AllAboard::Update.latest_timestamp
    }
  end
end
