Selectables::Engine.routes.draw do
  resources :selectables do
    get "by_category" => "selectables#selectable_by_category", on: :collection, as: "by_category"
  end

  root to: "selectables#index"
end
