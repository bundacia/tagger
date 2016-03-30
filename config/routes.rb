Rails.application.routes.draw do
  post   '/tags' => 'tags#set_tags'
  get    '/tags/:entity_type/:entity_id' => 'tags#show'
  delete '/tags/:entity_type/:entity_id' => 'tags#destroy'

  get    '/stats' => 'tags#show_summary_stats'
  get    '/stats/:entity_type/:entity_id' => 'tags#show_stats'
end
