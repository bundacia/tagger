class EntitiesController < ApplicationController

  def set_tags
    entity = SetEntityTags.new(
      :entity_id   => params[:entity_id],
      :entity_type => params[:entity_type],
      :tags        => params[:tags],
    ).call
    render json: EntityPresenter.new(entity), status: 201
  end

  def show
    entity = get_entity
    render json: EntityPresenter.new(entity)
  end

  def destroy
    entity = get_entity
    entity.destroy!
    render nothing: true, status: 204
  end

  def show_stats
    entity = get_entity
    render json: EntityStatsPresenter.new(entity)
  end

  def show_summary_stats
    render json: TagStatsReport.new
  end

  private

  def get_entity
    Entity.find_by!(
      :entity_type => params[:entity_type],
      :external_id => params[:entity_id]  ,
    )
  end

end
