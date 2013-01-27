module AllAboard
  class Admin::SourcesController < ApplicationController
    before_filter :set_source, only: [ :edit, :update ]

    def index
      @source_names = SourceManager.instance.source_names
    end

    def edit
    end

    def update
      source_configuration.first_or_initialize.update_attributes!(configuration: params[:configurable_attributes])
      render :edit
    end

  protected

    def set_source
      @source = SourceManager.instance.source_for_name(params[:id])
    end

    def source_configuration
      AllAboard::Persistence::SourceConfigurationMetadata.where(source_name: @source.name)
    end
  end
end
