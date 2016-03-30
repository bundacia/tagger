class EntityPresenter

  attr_reader :entity

  def initialize(entity)
    @entity = entity
  end

  def as_json(ignore=nil)
    {
      :entity_id   => entity.external_id,
      :entity_type => entity.entity_type,
      :tags        => entity.tag_names  ,
    }
  end
end
