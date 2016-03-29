class TagsController < ActionController::API

  def set_tags
    SetEntityTags.new(
      :entity_id   => params[:entity_id],
      :entity_type => params[:entity_type],
      :tags        => params[:tags],
    ).call
    render nothing: true, status: 201
  end

  def show
    render json: EntityPresenter.new(entity), status: 200
  end

  def destroy
    entity.destroy!
    render nothing: true, status: 204
  end

  private

  def entity
    @entity ||= Entity.find_by!(
      :entity_type => params[:entity_type],
      :external_id => params[:entity_id]  ,
    )
  end

end
