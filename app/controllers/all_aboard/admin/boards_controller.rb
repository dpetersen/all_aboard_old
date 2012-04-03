class AllAboard::Admin::BoardsController < ApplicationController
  inherit_resources
  actions :index, :new, :create, :show
end
