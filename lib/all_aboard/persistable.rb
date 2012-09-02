module AllAboard::Persistable
  def save
    metadata_record.update_attributes(attribute_translation).tap do |did_save|
      @id = metadata_record.id if did_save
    end
  end

  def errors
    metadata_record.errors
  end

protected

  def metadata_record
    @metadata_record ||= (metadata_class.find_by_id(@id) || metadata_class.new)
  end
end
