class SourcesController < ApplicationController
  def index
    response_string = SourceManager.source_classes.inject("") do |buffer, source|
      buffer << source.new.render
    end
    render text: response_string
  end
end
