module AllAboard::Persistence::BoardPersistence
  extend ActiveSupport::Concern
  include AllAboard::Persistable

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
        attributes[:panes] = panes_for_slide_metadata(slide_metadata)
        a << AllAboard::Slide.new(attributes)
        a
      end
    end

    def panes_for_slide_metadata(slide_metadata)
      slide_metadata.perspective_assignments.inject([]) do |a, perspective_assignment_metadata|
        attributes = HashWithIndifferentAccess.new(perspective_assignment_metadata.attributes)
        attributes[:source] = AllAboard::SourceManager.instance.source_for_name(attributes[:source_name])
        attributes[:perspective] = attributes[:perspective_name]
        attributes[:configuration] = perspective_assignment_metadata.configuration
        a << AllAboard::Pane.new(attributes)
        a
      end
    end
  end

protected

  def attribute_translation
    {
      name: name
    }
  end

  def metadata_class
    AllAboard::Persistence::BoardMetadata
  end
end
