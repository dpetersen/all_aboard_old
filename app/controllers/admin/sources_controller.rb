class Admin::SourcesController < ApplicationController
  before_filter :set_source, only: [ :edit, :update ]

  def index
    @source_names = SourceManager.instance.source_names
  end

  def edit
  end

  def update
    params[:configurable_attributes].each do |attribute_name, attribute_value|
      if configured_attribute = ConfiguredAttribute.where(source_name: @source.name, name: attribute_name).first
        configured_attribute.update_attributes(value: attribute_value)
      else
        ConfiguredAttribute.create!(
          source_name: @source.name,
          name: attribute_name,
          value: attribute_value
        )
      end
    end

    render :edit
  end

protected

  def set_source
    @source = SourceManager.instance.source_for_name(params[:id])
  end
end
