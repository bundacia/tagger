class SetEntityTags

  def initialize(args)
    @entity_id   = args[:entity_id]   or raise Exceptions::BadRequest, "entity_id is required"
    @entity_type = args[:entity_type] or raise Exceptions::BadRequest, "entity_type is required"
    @tag_names   = args[:tags] || []
  end

  def call
    create_or_fetch_entity.tap do |entity|
      # NOTE: this is potentially destroying tags only to recreate some of the
      # same ones. If performance becomes an issue we could optimize this to be
      # smarter.
      entity.tags.destroy_all
      entity.tags.create tags
    end
  end

  private
  attr_reader :entity_id, :entity_type, :tag_names

  def create_or_fetch_entity
    @entity ||= begin
      attributes = {external_id: entity_id, entity_type: entity_type}
      Entity.find_by(attributes) ||
        Entity.new(attributes).tap(&:save!)
    end
  end

  def tags
    tag_names.map {|name| { tag: name } }
  end

end
