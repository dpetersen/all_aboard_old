module AllAboard::RoutableTo
  def self.included(base)
    base.extend ActiveModel::Naming
    base.send(:include, ActiveModel::Conversion)
  end

  def persisted?
    @id.present?
  end
end
