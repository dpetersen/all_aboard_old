class AllAboard::PaneSerializer < ActiveModel::Serializer
  #attributes :id, :position, :source_data, :template_markup
  attributes :id, :position, :source_data, :perspective, :compiled_template_path

  # ember-data goes on a fetching frenzy if the objects don't have ids, even if
  # they're embedded. At least it seems that way, and I can't figure it out.
  def id
    object.object_id
  end

  def source_data
    {
      id: object.source.try(:name),
      data_object: object.source.try(:retrieve_data) || {}
    }
  end

  # Probably not the greatest place for this.
  def compiled_template_path
    return nil if object.source.blank?
    object.source.filesystem_name + "/templates/" + object.perspective.gsub(" ", "").underscore
  end
end
