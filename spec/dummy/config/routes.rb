Rails.application.routes.draw do
  mount Kuroko2::Engine => '/'
  mount Kuroko2ReadOnly::Engine => '/kuroko2_read_only'
end
