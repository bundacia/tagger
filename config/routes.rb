Rails.application.routes.draw do
  post   '/entities' => 'entities#set_tags'
  get    '/entities/:entity_type/:entity_id' => 'entities#show'
  delete '/entities/:entity_type/:entity_id' => 'entities#destroy'

  get    '/stats' => 'entities#show_summary_stats'
  get    '/stats/:entity_type/:entity_id' => 'entities#show_stats'
end
