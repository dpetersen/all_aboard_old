module AllAboard::Persistence::BoardPersistence
  extend ActiveSupport::Concern

  module ClassMethods
    def all
      AllAboard::Persistence::BoardMetadata.all.map do |board_metadata|
        board_from_board_metadata(board_metadata)
      end
    end

    def find(id)
      board_metadata = AllAboard::Persistence::BoardMetadata.find(id)
      board_from_board_metadata(board_metadata)
    end

  protected

    def board_from_board_metadata(board_metadata)
      attributes = HashWithIndifferentAccess.new(board_metadata.attributes)
      attributes[:slides] = slides_for_board_metadata(board_metadata)

      new(attributes)
    end

    def slides_for_board_metadata(board_metadata)
      board_metadata.slides.inject([]) do |a, slide_metadata|
        attributes = HashWithIndifferentAccess.new(slide_metadata.attributes)
        attributes[:perspective_assignments] = perspective_assignemnts_for_slide_metadata(slide_metadata)
        a << AllAboard::Slide.new(attributes)
        a
      end
    end

    def perspective_assignemnts_for_slide_metadata(slide_metadata)
      slide_metadata.perspective_assignments.inject([]) do |a, perspective_assignment_metadata|
        attributes = HashWithIndifferentAccess.new(perspective_assignment_metadata.attributes)
        a << AllAboard::PerspectiveAssignment.new(attributes)
      end
    end
  end

  def save
    metadata_record.update_attributes(name: name).tap do |did_save|
      @id = metadata_record.id if did_save
    end
  end

  def errors
    metadata_record.errors
  end

protected

  def metadata_record
    @metadata_record ||= (
      AllAboard::Persistence::BoardMetadata.find_by_id(@id) ||
      AllAboard::Persistence::BoardMetadata.new
    )
  end
end
