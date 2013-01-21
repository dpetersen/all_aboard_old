class AllAboard::BoardSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :latest_timestamp
  has_many :slides, serializer: AllAboard::SlideSerializer

  def latest_timestamp
    AllAboard::Update.latest_timestamp
  end
end
