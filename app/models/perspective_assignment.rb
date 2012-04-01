class PerspectiveAssignment < ActiveRecord::Base
  belongs_to :slide

  validates :slide, :source_name, :perspective_name, presence: true

  after_initialize :ensure_positioned

  attr_accessible :perspective_name, :source_name, :source_and_perspective, :position

  def source_and_perspective=(source_and_perspective)
    split = source_and_perspective.split(",")
    self.source_name = split.first
    self.perspective_name = split[1..-1].join(",")
  end

  def source_and_perspective
    "#{self.source_name},#{self.perspective_name}"
  end

protected

  def ensure_positioned
    if slide.present? && position.blank?
      self.position = slide.perspective_assignments.count + 1
    end
  end
end
