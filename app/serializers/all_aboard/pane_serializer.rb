class AllAboard::PaneSerializer < ActiveModel::Serializer
  #attributes :id, :position, :source_data, :template_markup
  attributes :id, :position

  # ember-data goes on a fetching frenzy if the objects don't have ids, even if
  # they're embedded. At least it seems that way, and I can't figure it out.
  def id
    object.object_id
  end

  #def source_data
  #  {
  #    id: object.source.try(:name),
  #    data_object: object.source.try(:retrieve_data) || {}
  #  }
  #end
end
