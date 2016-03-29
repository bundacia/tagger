Rails.application.routes.draw do
  post   '/tags' => 'tags#set_tags'
  get    '/tags/:entity_type/:entity_id' => 'tags#show'
  delete '/tags/:entity_type/:entity_id' => 'tags#destroy'
end
