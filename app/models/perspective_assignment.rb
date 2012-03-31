class PerspectiveAssignment < ActiveRecord::Base
  belongs_to :slide

  validates :slide, :source_name, :perspective_name, presence: true

  attr_accessible :perspective_name, :source_name, :source_and_perspective

  def source_and_perspective=(source_and_perspective)
    split = source_and_perspective.split(",")
    self.source_name = split.first
    self.perspective_name = split[1..-1].join(",")
  end

  def source_and_perspective
    "#{self.source_name},#{self.perspective_name}"
  end
end
