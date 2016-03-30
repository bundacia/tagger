class EntityStatsPresenter

  attr_reader :entity

  def initialize(entity)
    @entity = entity
  end

  def as_json(options = nil)
    { tag_count: entity.tags.count }
  end

end
