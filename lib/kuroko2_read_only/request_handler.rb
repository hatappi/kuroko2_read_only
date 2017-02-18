require 'active_support'

module Kuroko2ReadOnly
  module RequestHandler
    extend ::ActiveSupport::Concern
    included do
      before_action :get_request_only
    end

    private

    def get_request_only
      if current_user && current_user.read_only?
        raise ::Kuroko2ReadOnly::AccessDenied unless request.get?
      end
    end
  end
end