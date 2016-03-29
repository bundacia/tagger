class TagsController < ActionController::API

  def set_tags
    SetEntityTags.new(
      :entity_id   => params[:entity_id],
      :entity_type => params[:entity_type],
      :tags        => params[:tags],
    ).call
    render nothing: true, status: 201
  end

end
