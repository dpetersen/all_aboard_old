class AllAboard::BoardsController < ApplicationController
  layout 'all_aboard/application'

  inherit_resources
  action :index, :show
end
