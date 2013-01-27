class AllAboard::BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :latest_timestamp
  has_many :slides, serializer: AllAboard::SlideSerializer

  def latest_timestamp
    AllAboard::Update.latest_timestamp
  end
end
