class Slide < ActiveRecord::Base
  belongs_to :board

  validates :board, :position, presence: true

  attr_accessible :position

  after_initialize :ensure_positioned

protected

  def ensure_positioned
    if board.present? && position.blank?
      self.position = board.slides.count + 1
    end
  end
end
