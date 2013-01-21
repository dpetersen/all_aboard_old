module AllAboard::Persistence::SlidePersistence
  extend ActiveSupport::Concern
  include AllAboard::Persistable

  module ClassMethods
  end

  def assign_to_board(board)
    @board_id = board.id
    metadata_record.board_id = @board_id
  end

protected

  def attribute_translation
    {
      layout_name: layout_name
    }
  end

  def metadata_class
    AllAboard::Persistence::SlideMetadata
  end
end
