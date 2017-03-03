Kuroko2ReadOnly::Engine.routes.draw do
  resource :settings, only: [:show, :update]
end