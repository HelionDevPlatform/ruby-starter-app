Rails.application.routes.draw do
  #resources :homes

  get 'homes/services'
  get 'vcap_services' => 'homes#vcap_services'
  get 'vcap_application' => 'homes#vcap_application'
  get 'vcap_links' => 'homes#vcap_links'

  root 'homes#index'

end
