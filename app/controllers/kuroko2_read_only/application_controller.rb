class Kuroko2ReadOnly::ApplicationController < ActionController::Base
  layout 'layouts/kuroko2/application'
  include Kuroko2ReadOnly::RequestHandler

  protect_from_forgery with: :exception
  prepend_before_action :require_sign_in

  helper_method :current_user

  def current_user
    Kuroko2::User.active.find(session[:user_id])
  end

  private

  def require_sign_in
    if session[:user_id].blank?
      redirect_to kuroko2.sign_in_path(return_to: url_for(params.permit!.to_h.merge(only_path: true)))
    end
  end
end